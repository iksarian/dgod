class CharactersController < ApplicationController
  before_action :set_character, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @characters = Character.all
    respond_with(@characters)
  end

  def show
    respond_with(@character)
  end

  def new
    if user_signed_in?
    @character = Character.new
    respond_with(@character)
    else
      redirect_to characters_path, alert: "You must be signed in to create a character."
    end
  end

  def edit
    unless user_signed_in? and current_user.id == @character.user_id
    end
  end

  def create
    @character = Character.new(character_params)
    if user_signed_in?
    @character.user_id = current_user.id if user_signed_in?
    @character.save
    else
      flash[:alert]="You must be signed in to create a character."
    end
    respond_with(@character)
  end

  def update
    if user_signed_in? and current_user.id == @character.user_id
    @character.update(character_params)
    respond_with(@character)
    else
      redirect_to characters_path, alert: "You do not have permission to edit."
    end
  end

  def destroy
    if user_signed_in? and current_user.id == @character.user_id
    @character.destroy
    respond_with(@character)
    else
      redirect_to characters_path, alert: "You do not have permission to destroy."
    end
  end

  private
    def set_character
      @character = Character.find(params[:id])
    end

    def character_params
      params.require(:character).permit(:name, :level, :hp, :mana, :gold, :user_id)
    end
end
