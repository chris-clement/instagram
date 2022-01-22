class PostsController < ApplicationController
  
  def initialize
    @posts = Post.all
  end
  
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(content: post_params["content"])
    respond_to do |format|
      if @post.valid?
        @post.save
        format.html { render action: "index", notice: "Post created!"}
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
