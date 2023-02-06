class UsersController < ApplicationController
   before_action :authenticate_user!, only: [:show]

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.all.page(params[:page]).per(3)
    @favorites = current_user.favorites.all.page(params[:page]).per(3)
    @likes = current_user.likes.all.page(params[:page]).per(3)
    @followings = @user.followings.all.page(params[:page]).per(3)
    @followers = @user.followers.all.page(params[:page]).per(3)
  end

  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :nickname, :image)
  end
  
end
