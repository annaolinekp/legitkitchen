class SavedRecipesController < ApplicationController
  def create
    # 1. find the recipe i want to save
    @recipe = Recipe.find(params[:recipe_id])
    # 2. Create a new instance of save recipe and find the id of the user (current user) and the recipe
    @saved_recipe = SavedRecipe.new(user: current_user, recipe: @recipe)
    # 3. save recipe
    if @saved_recipe.save
      respond_to do |format|
        # redirect to recipe just liked (recipe_path) and the new instance of saved recipe
        # and the saved recipe
        format.html { redirect_to recipe_path(@saved_recipe.recipe) }
        format.js  # <-- will render `app/views/comments/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'recipes' }
        format.js  # <-- idem
      end
    end
  end

  def destroy
    # 1. I need to find the recipe I want to unsave
    @saved_recipe = SavedRecipe.find(params[:id])
    # 2. then destroy it
    @saved_recipe.destroy
    @recipe = @saved_recipe.recipe
    respond_to do |format|
      format.html { redirect_to recipe_path(@saved_recipe.recipe) }
      format.js
    end
  end

end
