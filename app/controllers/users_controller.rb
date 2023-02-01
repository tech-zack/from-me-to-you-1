class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    @posts = current_user.posts.all.page(params[:page]).per(3)
    @user = current_user
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :nickname, :image)
  end
  
end
