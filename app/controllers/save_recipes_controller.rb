class SaveRecipesController < ApplicationController
  def create
    # 1. find the recipe i want to save
    @recipe = @recipe.find(params[:id])
   # 2. find the id of the user (current user) create a new instance of save recipe
    @save_recipe = Save_Recipe.new(user: current_user, recipe: @recipe)
   # 3. save recipe
   if @save_recipe.save
    redirect_to recipe_path(@save_recipe.recipe)
    else
      render '/recipes'
    end
  # 4.
  end
end
