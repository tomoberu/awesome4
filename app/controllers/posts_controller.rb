class PostsController < ApplicationController

  def index
    @posts = Post.all.order("created_at DESC").page(params[:page])
    # @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new
    respond_to do |format|
      format.html { redirect_to root_path  }
      format.json
    end
    
  # respond_to do |format|
  #   format.html { redirect_to :root }
  #   format.json { render json: @post}
  # end
  end

  def edit
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
  end

  def search
    @posts = Post.all.order("created_at DESC").page(params[:page])
  end

  private

  def post_params
    params.require(:post).permit(:name, :image, :text, :address, :age).merge(user_id: current_user.id)
  end
end
