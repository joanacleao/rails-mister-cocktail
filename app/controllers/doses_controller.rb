class DosesController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    #@ingredient = Ingredient.find(params[:cocktail_id][:ingredient_id])
    #byebug
    @dose = Dose.new

  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])

    #@ingredient = Ingredient.find(params[:dose][:ingredient_id])
    @dose = Dose.new(doses_params)
    @dose.cocktail = @cocktail
    #@dose.ingredient = @ingredient

    if @dose.save

      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

    def destroy

      @dose = Dose.find(params[:id])
      @dose.destroy

    end

  private
  def doses_params
    params.require(:dose).permit(:description, :ingredient_id )
  end


end
