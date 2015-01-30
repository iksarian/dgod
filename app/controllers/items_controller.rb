class ItemsController < ApplicationController
  before_action :check_if_gm
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @items = Item.all
    respond_with(@items)
  end

  def show
    respond_with(@item)
  end

  def new
    @item = Item.new
    respond_with(@item)
  end

  def edit
  end

  def create
    logger.info params[:item]
    logger.info params[:item][:classes]
    @item = Item.new(name: params[:item][:name], damage: params[:item][:damage], mf: params[:item][:mf], ac: params[:item][:ac], mr: params[:item][:mr], price: params[:item][:price], bonus: params[:item][:bonus], classes: params[:item][:classes], quality: params[:item][:quality], equipment_type: params[:item][:equipment_type])
    @item.save!
    respond_with(@item)
  end

  def update
    @item.update(item_params)
    respond_with(@item)
  end

  def destroy
    @item.destroy
    respond_with(@item)
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :damage, :mf, :ac, :mr, :price, :bonus, :classes, :quality, :equipment_type)
    end
end
