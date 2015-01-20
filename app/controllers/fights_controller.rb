class FightsController < ApplicationController
  before_action :set_fight, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @fights = Fight.all
    respond_with(@fights)
  end

  def show
    respond_with(@fight)
  end

  def new
    @fight = Fight.new
    respond_with(@fight)
  end

  def edit
  end

  def create
    @fight = Fight.new(fight_params)
    @fight.save
    respond_with(@fight)
  end

  def update
    @fight.update(fight_params)
    respond_with(@fight)
  end

  def destroy
    @fight.destroy
    respond_with(@fight)
  end

  private
    def set_fight
      @fight = Fight.find(params[:id])
    end

    def fight_params
      params.require(:fight).permit(:fight_over, :turn_count, :exp_gain)
    end
end
