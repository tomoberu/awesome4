class PostsController < ApplicationController

  def index
    @posts = Post.all.order("created_at DESC").page(params[:page])
    # @posts = Post.all
  end

  def new
    @post = Post.new
    @photo = @post.photos.new
  end

  def create
    @post = Post.new(post_params)
    binding.pry
    @post.save!
    redirect_to root_path(@post)
  end
    
  # respond_to do |format|
  #   format.html { redirect_to :root }
  #   format.json { render json: @post}
  # endpost_params
  

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
    params.require(:post).permit(:name, :text, :address, :age, photos_attributes: [:image]).merge(user_id: current_user.id)
  end
end
