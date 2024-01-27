class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    @comment.save
  end
    
  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy!
  end
    
  private
    
  def comment_params
    params.require(:comment).permit(:body, :comment_image, :comment_image_cache, :remove_comment_image).merge(post_id: params[:post_id])
  end
end