class CocktailsController < ApplicationController
  before_action :find_cocktail, only: %i[show]

  def index
    @cocktails = Cocktail.all
    @cocktail = Cocktail.new
  end

  def show
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail = Cocktail.new if @cocktail.save

    @cocktails = Cocktail.all
    render :index
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
