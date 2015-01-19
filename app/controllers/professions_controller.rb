class ProfessionsController < ApplicationController
  before_action :set_profession, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @professions = Profession.all
    respond_with(@professions)
  end

  def show
    respond_with(@profession)
  end

  def new
    @profession = Profession.new
    respond_with(@profession)
  end

  def edit
  end

  def create
    @profession = Profession.new(profession_params)
    @profession.save
    respond_with(@profession)
  end

  def update
    @profession.update(profession_params)
    respond_with(@profession)
  end

  def destroy
    @profession.destroy
    respond_with(@profession)
  end

  private
    def set_profession
      @profession = Profession.find(params[:id])
    end

    def profession_params
      params.require(:profession).permit(:title, :stats)
    end
end
