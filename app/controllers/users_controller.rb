class UsersController < ApplicationController
   before_action :authenticate_user!, only: [:show, :edit]

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.all.page(params[:page]).per(3)
    @favorites = current_user.favorites.all.page(params[:page]).per(3)
    @likes = current_user.likes.all.page(params[:page]).per(3)
    @followings = @user.followings.all.page(params[:page]).per(3)
    @followers = @user.followers.all.page(params[:page]).per(3)
    @current_RoomUser = RoomUser.where(user_id: current_user.id)
    @another_User = RoomUser.where(user_id: @user.id)
    if @user.id != current_user.id
      @current_RoomUser.each do |current|
        @another_User.each do |another|
          if current.room_id == another.room_id then
            @isRoom = true
            @roomId = current.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @RoomUser = RoomUser.new
      end
    end
  end

  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end

  def edit
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :nickname, :image)
  end

end
