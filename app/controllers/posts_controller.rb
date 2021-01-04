class PostsController < ApplicationController
  before_action :set_params, only: %i[ edit update show destory]
  def index
    @posts = Post.all.order('created_at DESC')
  end

  def new
    @post = Post.new
  end
  def create
    @post = Post.new(create_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  def edit; end

  def update
    if @post.update(post_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  def show
  end
  

  private
  def create_params
    params.require(:post).permit(:title,:place,:content,:image).merge(user_id: current_user.id)
  end

  def set_params
    @post = Post.find(params[:id])
  end
  
  
end
