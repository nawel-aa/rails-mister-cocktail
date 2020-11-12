class CocktailsController < ApplicationController
  before_action :find_cocktail, only: :show

  def index
    @cocktails = Cocktail.all
    @cocktail = Cocktail.new
  end

  def show
    @doses = @cocktail.doses
    @dose = Dose.new
  end

  def create
    # Create new cocktail
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail = Cocktail.new if @cocktail.save

    # Variable needed for rendering :index
    @cocktails = Cocktail.all
    render :index
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :image_url)
  end
end
