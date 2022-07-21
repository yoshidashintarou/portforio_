class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "投稿できました"
      redirect_to users_path(@post.id)
    else
      render :new
    end
  end


  def show
    @post = current_user(post_params)
    @comment = Comment.new
    @comments = @post.comments
  end


  def index
    @posts = Post.page(params[:page]).per(3)
    @users = User.all
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to post_path
  end



private
  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end

  def user_params
    params.require(:user).permit(:name, :email, :image)
  end

end