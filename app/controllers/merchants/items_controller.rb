class Merchants::ItemsController < ApplicationController
  before_action :check_if_gm, only: [:new, :create, :edit, :update, :destroy, :give]
  before_action :set_merchant
  before_action :set_item, only: [:show, :edit, :update, :destroy, :buy]
  respond_to :html

  def buy
    if current_user.buy_item(@item)
      redirect_to merchant_path(@merchant), notice:"You bought #{@item.name} for #{@item.price}gp!"
    else
      redirect_to merchant_path(@merchant), alert:"You can not afford that item."
    end
  end
  def show
    respond_with(@merchant, @item)
  end

  def give
    @item = GlobalItem.find(params[:merchant][:add_item])
    @merchant.give_item(@item)
    redirect_to request.referer, notice:"You gave #{@merchant.name} the #{@item.name}!"
  end


  def destroy
    @item.destroy
    redirect_to request.referer, notice:"You removed #{@item.name}!"
  end

  private
    def set_item
      @item = @merchant.items.find(params[:id])
    end
    def set_merchant
      @merchant = Merchant.find(params[:merchant_id])
    end
    def item_params
      params.require(:item).permit(:name, :damage, :ac, :price, :bonus, :quality, :equipment_type)
    end
end
