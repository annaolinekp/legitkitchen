class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:search].present?
      @recipes = Recipe.search_by_name_and_description(params[:search])
    elsif params[:dietary_requirements].present? || params[:category].present?
      @recipes = Recipe.filter(params.slice(:category, :dietary_requirements))
    else
      @recipes = Recipe.all
    end
  end

  def show
    @quantity = Quantity.new
    @comment = Comment.new
    # @comments = @recipe.comments
  end

  def new
    @user = current_user
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    if @recipe.save
      ingredients_hash = ingredients_params
      amounts_hash = amounts_params
      quantity_array = []
      ingredients_hash.each do |key, value|
        identity_num = key[-1, 1]
        quantity_hash = { ingredient_id: value,
                          description: amounts_hash["amount#{identity_num}"],
                          recipe_id: @recipe.id }
        quantity_array.push(Quantity.new(quantity_hash))
      end
      quantity_array.each do |quantity|
        if quantity.save
          next
        else
          render 'new' and return
        end
      end
      redirect_to recipe_path(@recipe)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    raise
    @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe)
  end

  def destroy
    @recipe.destroy
    @user = current_user
    redirect_to user_path(@user)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :cooktime, :preptime, :category, :dietary_requirements, :picture_url)
  end

  def ingredients_params
    # handle ingredients and amount as hashes in the create action
    count_ingredients = 0
    ingredients_hash = {}
    params[:recipe][:ingredients].each do |key, value|
      strong_params_hash = params.require(:recipe).require(:ingredients).permit("ingredient_id#{count_ingredients}")
      ingredients_hash["ingredient_id#{count_ingredients}"] = strong_params_hash["ingredient_id#{count_ingredients}"]
      count_ingredients = count_ingredients + 1
    end
    return ingredients_hash
  end

  def amounts_params
    # handle ingredients and amount as hashes in the create action
    count_amounts = 0
    amounts_hash = {}
    params[:recipe][:amounts].each do |key, value|
      strong_params_hash = params.require(:recipe).require(:amounts).permit("amount#{count_amounts}")
      amounts_hash["amount#{count_amounts}"] = strong_params_hash["amount#{count_amounts}"]
      count_amounts = count_amounts + 1
    end
    return amounts_hash
  end

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end
end
