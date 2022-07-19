class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
     @user = current_user
     @posts = @user.post.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.post
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
     redirect_to user_path
    else
      render :edit
    end
  end


 

private
def user_params
  params.require(:user).permit(:name, :email, :image)
end

def post_params
    params.require(:post).permit(:title, :body)
end
end
