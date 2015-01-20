class MerchantsController < ApplicationController
  before_action :check_if_gm
  before_action :set_merchant, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @merchants = Merchant.all
    respond_with(@merchants)
  end

  def show
    respond_with(@merchant)
  end

  def new
    #if user_signed_in? and current_user.id == @character.user_gm
    @merchant = Merchant.new
    respond_with(@merchant)
   # end
  end

  def edit
  end

  def create
    @merchant = Merchant.new(merchant_params)
    @merchant.save
    respond_with(@merchant)
  end

  def update
    @merchant.update(merchant_params)
    respond_with(@merchant)
  end

  def destroy
    @merchant.destroy
    respond_with(@merchant)
  end

  private
    def set_merchant
      @merchant = Merchant.find(params[:id])
    end

    def merchant_params
      params.require(:merchant).permit(:name, :quality)
    end
end
