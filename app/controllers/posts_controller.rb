class PostsController < ApplicationController
  before_action :check_signed_in, only: [:new, :create]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id  = current_user.id

    if @post.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def index
    @posts = Post.all
  end

  private

  def check_signed_in
    redirect_to login_path unless logged_in?
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
