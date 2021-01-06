class UsersController < ApplicationController
   def index
    @posts = current_user.posts
    @name = current_user.name
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
     user = User.find(params[:id])
    @name = user.name
    @posts = user.posts
   end

  private

  def user_params
    params.require(:user).permit(:name, :email,:password).merge(post_id: params[:post_id])
  end
end
