class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def show
    @saved_recipes = SavedRecipe.where(user: current_user)
    @recipes = Recipe.where(user: current_user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    @user.save ? (redirect_to user_path(@user)) : (render 'new')
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def destroy
    @user.destroy
    redirect_to user_path
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :profile_picture_url)
  end
end
