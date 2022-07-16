class PostsController < ApplicationController


  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
       @post.user = current_user
      flash[:notice] = "投稿できました"
      redirect_to post_path(@post.id)
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
    @user = current_user
  end


private
  def post_params
    params.require(:post).permit(:title, :body,)
  end

  def user_params
    params.require(:user).permit(:name, :email, :image)
  end

end