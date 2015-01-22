class Monsters::ItemsController < ApplicationController
  before_action :check_if_gm
  before_action :set_monster
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  respond_to :html


  def show
    respond_with(@monster, @item)
  end

  def new
    @item = @monster.items.new
    respond_with(@monster, @item)
  end

  def edit
  end

  def create
    @item = @monster.items.new(item_params)
    @item.save
    respond_with(@monster, @item)
  end

  def update
    @item.update(item_params)
    respond_with(@monster, @item)
  end

  def destroy
    @item.destroy
    respond_with(@monster)
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
