class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create,:edit,:update,:destroy]
  before_action :set_q, only: [:index, :search]
  before_action :search_category_post, only:[:index, :category, :search, :show]

  def index
    @posts = Post.page(params[:page]).per(3).order("created_at DESC")
    @random = Post.order("RAND()").limit(1)
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
    @comment = Comment.new 
    @comments = @post.comments.page(params[:page]).per(7).reverse_order 
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

  def category
    @posts = @q.result.page(params[:page]).per(3).order("created_at DESC")
    category_id = params[:q][:category_id_eq]
    @category = Category.find_by(id: category_id)
  end

  def search
    @results = @q.result.page(params[:page]).per(3).order("created_at DESC")
  end

  private

  def set_q
    @q = Post.ransack(params[:q])
  end

  def search_category_post
    @q= Post.ransack(params[:q])
  end

  def post_params
    params.require(:post).permit(:title, :text, :image, :category_id)
  end
end
