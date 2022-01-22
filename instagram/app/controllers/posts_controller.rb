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
      if @post.valid?
        @post.save
        flash.alert = "Thanks for posting"
      else
        flash.alert = "Post not made"
      end
      redirect_to '/posts'
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
