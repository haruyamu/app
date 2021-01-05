class PostsController < ApplicationController
  before_action :set_params, only: %i[edit update show ]
  before_action :authenticate_user!, except: [:index,:show,:search]

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
    if @post.update(create_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def search
    @posts = Post.search(params[:keyword])
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
    @like = Like.new
  end
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end

  private
  def create_params
    params.require(:post).permit(:title,:place,:content,:image).merge(user_id: current_user.id)
  end

  def set_params
    @post = Post.find(params[:id])
  end
end
