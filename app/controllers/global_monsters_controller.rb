class GlobalMonstersController < ApplicationController
  before_action :set_global_monster, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @global_monsters = GlobalMonster.all
    respond_with(@global_monsters)
  end

  def show
    respond_with(@global_monster)
  end

  def new
    @global_monster = GlobalMonster.new
    respond_with(@global_monster)
  end

  def edit
  end

  def create
    @global_monster = GlobalMonster.new(global_monster_params)
    @global_monster.save
    respond_with(@global_monster)
  end

  def update
    @global_monster.update(global_monster_params)
    respond_with(@global_monster)
  end

  def destroy
    @global_monster.destroy
    respond_with(@global_monster)
  end

  private
    def set_global_monster
      @global_monster = GlobalMonster.find(params[:id])
    end

    def global_monster_params
      params.require(:global_monster).permit(:name, :drops, :damage, :force, :ac, :mr, :level, :base_exp)
    end
end
