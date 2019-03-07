class SavedRecipesController < ApplicationController
  def create
    # 1. find the recipe i want to save
    @recipe = @recipe.find(params[:id])
   # 2. Create a new instance of save recipe and find the id of the user (current user) and the recipe
    @saved_recipe = SavedRecipe.new(user: current_user, recipe: @recipe)
   # 3. save recipe
   if @saved_recipe.save
    redirect_to recipe_path(@saved_recipe.recipe)
    else
      render '/recipes'
    end
  # 4.
  end
end
