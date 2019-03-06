class QuantitiesController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @quantity = Quantity.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @quantity = Quantity.new(quantity_params)
    @quantity.recipe = @recipe
    if @quantity.save
      redirect_to recipe_path(@recipe)
    else
      render 'new'
    end
  end

  def destroy
    @quantity = Quantity.find(params[:id])
    @quantity.destroy
    redirect_to recipe_path(@quantity.recipe)

  end

  private

  def quantity_params
    params.require(:quantity).permit(:description, :ingredient_id)
  end
end
