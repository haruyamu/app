class UsersController < ApplicationController
  def index
     @posts = Post.all.order('created_at DESC')
  end
  
   def edit
   end
   def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
   end
   def show
    @posts = Post.all.order('created_at DESC')
    @name = current_user.name
    # @post = Post.find(params[:post_id])
   end

  private

  def user_params
    params.require(:user).permit(:name, :email,:password)
  end
end
