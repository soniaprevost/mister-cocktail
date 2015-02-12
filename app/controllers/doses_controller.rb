class DosesController < ApplicationController
  before_action :find_cocktail_and_ingredients, only: [:new, :create, :destroy]

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy

    redirect_to cocktail_path(@cocktail)
  end



  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def find_cocktail_and_ingredients
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredients = Ingredient.all
  end


end
