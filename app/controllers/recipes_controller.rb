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
    @recipe.save! ? (redirect_to recipe_path(@recipe)) : (render 'new')
  end

  def edit
  end

  def update
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

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end
end
