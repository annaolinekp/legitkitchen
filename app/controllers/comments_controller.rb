class CommentsController < ApplicationController
  before_action :find_recipe, only: [:create, :destroy]
  before_action :find_current_user, only: [:create, :destroy]
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.save ? (redirect_to recipe_path(@comment.recipe)) : (render 'new')
  end

  def destroy
    @comment.destroy
    redirect_to recipe_path(@recipe)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def find_current_user
    @comment.user = current_user
  end

  def find_recipe
    @comment.recipe = Recipe.find(params[:recipe_id])
  end
end
