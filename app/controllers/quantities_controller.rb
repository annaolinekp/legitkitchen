class QuantitiesController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @quantity = Quantity.new
  end
end
