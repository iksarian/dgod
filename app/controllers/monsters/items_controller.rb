class Monsters::ItemsController < ApplicationController
  before_action :check_if_gm
  before_action :set_monster
  before_action :set_item, only: [:show, :edit, :update, :destroy, :take]

  respond_to :html
  def give
    @item = GlobalItem.find(params[:monster][:drops])
    @monster.give_item(@item)
    redirect_to request.referer, notice:"You gave #{@monster.name} the #{@item.name}!"
  end
  def take
     @monster.take_item(@item)
     redirect_to request.referer, notice:"You remove the #{@item.name} from #{@monster.name}!"
  end

  private
    def set_item
      @item = @monster.items.find(params[:id])
    end
    def set_monster
      @monster = Monster.find(params[:monster_id])
    end
    def item_params
      params.require(:item).permit(:name, :damage, :ac, :price, :bonus, :quality)
    end
end
