class AbilitiesController < ApplicationController
  before_action :set_ability, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @abilities = Ability.all
    respond_with(@abilities)
  end

  def show
    respond_with(@ability)
  end

  def new
    @ability = Ability.new
    respond_with(@ability)
  end

  def edit
  end

  def create
    @ability = Ability.new(ability_params)
    @ability.save
    respond_with(@ability)
  end

  def update
    @ability.update(ability_params)
    respond_with(@ability)
  end

  def destroy
    @ability.destroy
    respond_with(@ability)
  end

  private
    def set_ability
      @ability = Ability.find(params[:id])
    end

    def ability_params
      params.require(:ability).permit(:mpcost, :hpcost, :description)
    end
end
