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
    else
      render 'new'
    end
  end

  private

  def quantity_params
    params.require(:quantity).permit(:description, :ingredient_id)
  end
end
