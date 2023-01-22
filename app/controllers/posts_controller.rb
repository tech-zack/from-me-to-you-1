class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create]

  def index
    @posts = Post.all.page(params[:page]).per(3)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to root_path  
   else
      render :new 
   end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :image)
  end
end
