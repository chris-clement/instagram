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
    p "Testing playing with hashtags params"
    p post_params["hashtags"].strip.split('#')
    @post = Post.new(content: post_params["content"], hashtags: post_params["hashtags"].strip.split('#'))
    @post.post_photo.attach(post_params["post_photo"])
      if @post.post_photo.attached? == false
        flash.alert = "Instagram requires you have a photo with each post. Try again."
      elsif @post.valid?
        @post.save
        flash.alert = "Thanks for posting"
      else
        flash.alert = "Post not made"
      end
      redirect_to '/posts'
  end

  private

  def post_params
    params.require(:post).permit(:content, :post_photo, :hashtags)
  end
end
