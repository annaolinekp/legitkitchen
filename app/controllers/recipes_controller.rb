class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show, :edit, :update, :destroy]
  # before_action :find_user, only: [:create, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @recipes = Recipe.all
  end

  def show
    @user = current_user
    @comments = @recipe.comments
  end

  def new
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
    redirect_to recipe_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :cooktime, :preptime, :category)
  end

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

  # def find_user
  #   @recipe.user = current_user
  # end
end
