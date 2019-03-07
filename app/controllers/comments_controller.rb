class CommentsController < ApplicationController
  before_action :find_recipe, only: [:new, :create]
  # before_action :find_current_user, only: [:destroy]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.recipe = @recipe
    @comment.user = current_user
    if @comment.save
      respond_to do |format|
        format.html { redirect_to recipe_path(@recipe) }
        format.js  # <-- will render `app/views/comments/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'recipes/show' }
        format.js  # <-- idem
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { render "recipes/index" }
      format.js  # <-- idem
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def find_current_user
    @comment.user = current_user
  end

  def find_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end
end
