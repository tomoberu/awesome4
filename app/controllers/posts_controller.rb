class PostsController < ApplicationController

  def index
    @posts = Post.all.order("created_at DESC").page(params[:page])
    # @posts = Post.all
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

  def search
    @posts = Post.search(params[:keyword])
  end

  private

  def post_params
    params.require(:tweet).permit(:name, :image, :text, :keyword).merge(user_id: current_user.id)
  end

end
