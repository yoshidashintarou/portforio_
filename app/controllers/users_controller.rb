class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def edit
    @user = current_user
  end

  def index
    @users = User.all
  end

  def show
    @user = current_user
  end

  def update
    @user = current_user
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

end
