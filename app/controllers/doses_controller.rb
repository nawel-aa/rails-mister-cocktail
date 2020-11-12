class DosesController < ApplicationController
  def create
    # Creating the dose
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail

    # Variable needed to render cocktail show
    @doses = @cocktail.doses
    @dose = Dose.new if @dose.save
    render '/cocktails/show'
  end

  def destroy
    dose = Dose.find(params[:id])
    dose.delete

    redirect_to cocktail_path(dose.cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
