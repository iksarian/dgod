class Users::ItemsController < ApplicationController
  before_action :check_if_gm
  before_action :set_item, only: [:show, :edit, :update, :destroy, :sell]

  respond_to :html

  def index
    @items = Item.all
    respond_with(@items)
  end
  def sell
    @item = current_user.items.find(params[:id])
    current_user.sell_item(@item)
    redirect_to request.referer, notice:"You sold #{@item.name} for #{(@item.price/2)}gp!"

  end
  def destroy
    @item.destroy
    redirect_to request.referer, notice: "#{@item.name} was destroyed."
  end

  private
    def set_item
      @item = current_user.items.find(params[:id])
    end

end
