class TurnsController < ApplicationController
  before_action :set_turn, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @turns = Turn.all
    respond_with(@turns)
  end

  def show
    respond_with(@turn)
  end

  def new
    @turn = Turn.new
    respond_with(@turn)
  end

  def edit
  end

  def create
    @turn = Turn.new(turn_params)
    @turn.save
    respond_with(@turn)
  end

  def update
    @turn.update(turn_params)
    respond_with(@turn)
  end

  def destroy
    @turn.destroy
    respond_with(@turn)
  end

  private
    def set_turn
      @turn = Turn.find(params[:id])
    end

    def turn_params
      params.require(:turn).permit(:turn_count, :performer_id, :target_id, :action_type)
    end
end
