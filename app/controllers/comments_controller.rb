class CommentsController < ApplicationController
   def create
    post = Post.find(params[:post_id])
    comment = current_user.comments.new(comment_params)
    comment.post_id = post.id
    if comment.save
     redirect_to post_path(post)
    else
     flash[:notice] = "空白だとコメントできません"
     redirect_to edit_postpath(post)
    end
   end


  def destroy
   @comment = Comment.find(params[:id])
   @comment.destroy
    if current_user
      redirect_to post_path(current_user.id)
    else
      redirect_to post_path(params[:post_id])
    end
  end
end

 private
  def comment_params
    params.require(:comment).permit(:comment)
  end

