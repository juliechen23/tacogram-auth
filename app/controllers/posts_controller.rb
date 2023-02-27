class PostsController < ApplicationController

    def index
      @posts = Post.all
    end
  
    def new
      @post = Post.new
    end
  
    def create
      @post = Post.new
      @post["body"] = params["post"]["body"]
      @post["image"] = params["post"]["image"]
      @post.save
      redirect_to "/posts"
    end
  
  end