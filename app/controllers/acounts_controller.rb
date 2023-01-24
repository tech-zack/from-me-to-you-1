class AcountsController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    @posts = current_user.posts.all.page(params[:page]).per(3)
  end
end