class Users::FightsController < ApplicationController
  before_action :set_fight, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @fights = Fight.all
    respond_with(@fights)
  end

  def show
    respond_with(@fight)
  end
  def attack
    @fight = Fight.find(params[:id])
    if @fight.fight_over == false
      @fight.attack
    redirect_to fight_users_path(@fight)
    else
    redirect_to fight_users_path(@fight), alert:"The fight has already been won!"

    end
  end

  def add_character
    @fight = Fight.new(user_id: current_user.id)
    character =  current_user.characters.find(params[:fight][:character])
    monster = GlobalMonster.find(params[:fight][:monster])
    @fight.create_new_fight(character, monster)
    redirect_to fight_users_path(@fight)
  end
  def new_fight
    @fight = Fight.new
    respond_with(@fight)
  end

  def create
    @fight = Fight.new(fight_params)
    @fight.save
    respond_with(@fight)
  end

  private
  def set_fight
    @fight = Fight.find(params[:id])
  end

  def fight_params
    params.require(:fight).permit(:character, :enemy, :fight_over, :turn_count, :exp_gain)
  end
end
