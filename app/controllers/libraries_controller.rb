class LibrariesController < ApplicationController
  before_action :set_q, only: [:index]

  def index
  end

  def show
  end

  private

  def set_q
    @q = Post.ransack(params[:q])
  end

end
