class Merchants::ItemsController < ApplicationController
  before_action :check_if_gm
  before_action :set_merchant
  before_action :set_item, only: [:show, :edit, :update, :destroy, :buy]
  respond_to :html

  def buy
    current_user.items.create(name: @item.name, damage: @item.damage, ac: @item.ac, price: @item.price, bonus: @item.bonus, quality: @item.quality)
    redirect_to merchant_path(@merchant), notice:"You bought #{@item.name}"
  end
  def show
    respond_with(@merchant, @item)
  end

  def new
    @item = @merchant.items.new
    respond_with(@merchant, @item)
  end

  def edit
  end

  def create
    @item = @merchant.items.new(item_params)
    @item.save
    respond_with(@merchant, @item)
  end

  def update
    @item.update(item_params)
    respond_with(@merchant, @item)
  end

  def destroy
    @item.destroy
    respond_with(@merchant)
  end

  private
    def set_item
      @item = @merchant.items.find(params[:id])
    end
    def set_merchant
      @merchant = Merchant.find(params[:merchant_id])
    end
    def item_params
      params.require(:item).permit(:name, :damage, :ac, :price, :bonus, :quality)
    end
end
