class CharactersController < ApplicationController
  before_action :set_character, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @characters = Character.where(user_id: current_user.id)
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
      redirect_to request.referer, alert: "You must be signed in to create a character."
    end
  end

  def edit
    unless user_signed_in? and current_user.id == @character.user_id
    end
  end

  def create
    @character = Character.new(name: params[:character][:name], profession_id: params[:character][:profession_id])
    if user_signed_in?
    @character.user_id = current_user.id
    @character.save
    else
      flash[:alert]="You must be signed in to create a character."
    end
    respond_with(@character)
  end

  def update
    if user_signed_in? and current_user.id == @character.user_id
      if current_user.is_gm
        @character.update(name: params[:character][:name], profession_id: params[:character][:profession_id], level: params[:character][:level], hp: params[:character][:hp], mana: params[:character][:mana])
      else
        @character.update(name: params[:character][:name])
      end
      respond_with(@character)
    else
      redirect_to request.referer, alert: "You do not have permission to edit."
      respond_with(@character)
    end
  end

  def destroy
    if user_signed_in? and current_user.id == @character.user_id
    @character.destroy
    respond_with(@character)
    else
      redirect_to request.referer, alert: "You do not have permission to destroy."
    end
  end

  private
    def set_character
      @character = Character.find(params[:id])
    end

    def character_params
      params.require(:character).permit(:name, :profession_id, :level, :hp, :mana, :magic_resist, :armor_class)
    end
end
