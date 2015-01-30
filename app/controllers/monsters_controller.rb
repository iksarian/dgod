class MonstersController < ApplicationController
  before_action :check_if_gm
  before_action :set_monster, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @monsters = Monster.all
    respond_with(@monsters)
  end

  def show
    respond_with(@monster)
  end

  def new
    @monster = Monster.new
    respond_with(@monster)
  end

  def edit
  end

  def create
    @monster = Monster.new(monster_params)
    @monster.save
    respond_with(@monster)
  end

  def update
    @monster.update(monster_params)
    respond_with(@monster)
  end

  def destroy
    @monster.destroy
    respond_with(@monster)
  end

  private
    def set_monster
      @monster = Monster.find(params[:id])
    end

    def monster_params
      params.require(:monster).permit(:name, :drops, :damage, :force, :ac, :mr, :level)
    end
end
