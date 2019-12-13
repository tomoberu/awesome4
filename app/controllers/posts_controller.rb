class PostsController < ApplicationController

  def index
    # @posts = Posts.all.order("created_at DESC").page(params[:page]).per(3)
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
  end

  def edit
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
  end

  private

  def post_params
    params.require(:post).permit(:text, :image).merge(user_id: current_user.id)
  end

end
