class GlobalItemsController < ApplicationController
  before_action :set_global_item, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @global_items = GlobalItem.all
    respond_with(@global_items)
  end

  def show
    respond_with(@global_item)
  end

  def new
    @global_item = GlobalItem.new
    respond_with(@global_item)
  end

  def edit
  end

  def create
    @global_item = GlobalItem.new(global_item_params)
    @global_item.save
    respond_with(@global_item)
  end

  def update
    @global_item.update(global_item_params)
    respond_with(@global_item)
  end

  def destroy
    @global_item.destroy
    respond_with(@global_item)
  end

  private
    def set_global_item
      @global_item = GlobalItem.find(params[:id])
    end

    def global_item_params
      params.require(:global_item).permit(:name, :damage, :ac, :price, :bonus, :quality, :equipment_type)
    end
end
