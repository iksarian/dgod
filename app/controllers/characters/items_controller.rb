class Characters::ItemsController < ApplicationController
  before_action :check_if_gm
  before_action :set_character
  before_action :set_item, only: [:show, :edit, :update, :destroy, :take, :equip, :unequip]

  respond_to :html
  def give
    @item = current_user.items.find(params[:id])
    @character.give_item(@item)
    redirect_to character_path(@character), notice:"You gave #{@character.name} #{@item.name}!"
  end
  def take
     @character.take_item(@item)
     redirect_to character_path(@character), notice:"You take #{@item.name} from #{@character.name}!"
  end
  def equip
    if @character.equip_item(@item)
      redirect_to request.referer, notice:"You equip #{@item.name}!"
    else
      redirect_to request.referer, alert:"You cannot equip this item."
    end
  end
  def unequip
    @character.unequip_item(@item)
    redirect_to request.referer, notice:"You unequip #{@item.name}!"
  end
  def show
    respond_with(@character, @item)
  end

  def new
    @item = @character.items.new
    respond_with(@character, @item)
  end

  def edit
  end

  def create
    @item = @character.items.new(item_params)
    @item.save
    respond_with(@character, @item)
  end

  def update
    @item.update(item_params)
    respond_with(@character, @item)
  end

  def destroy
    @item.destroy
    redirect_to request.referer, notice: "You destroyed #{@item}!"
  end

  private
    def set_item
      @item = @character.items.find(params[:id])
    end
    def set_character
      @character = Character.find(params[:character_id])
    end
    def item_params
      params.require(:item).permit(:name, :damage, :mf, :ac, :mr, :price, :bonus, :quality, :equipment_type)
    end
end
