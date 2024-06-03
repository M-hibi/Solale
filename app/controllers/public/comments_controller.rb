class Public::CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    post = Post.find(params[:post_id])
    comment = current_user.comments.new(comment_params)
    comment.post_id = post.id
    if comment.save
      redirect_to request.referer, notice: "Solaleにコメントしました"
    else
        @error_comment = comment
        @post = Post.find(params[:post_id])
        @comment = Comment.new
        render 'public/posts/show'
    end
  end

  def destroy
    Comment.find(params[:post_id]).destroy
    redirect_to post_path(params[:post_id])
  end

  private

  def comment_params
     params.require(:comment).permit(:comment)
  end

end
