class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create,:edit,:update,:destroy]
  before_action :set_q, only: [:index, :search]

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
      redirect_to posts_index_path 
   else
      render :new 
   end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_index_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to posts_index_path
    end
  end

  def search
    @results = @q.result
  end

  private

  def set_q
    @q = Post.ransack(params[:q])
  end

  def post_params
    params.require(:post).permit(:title, :text, :image)
  end
end
