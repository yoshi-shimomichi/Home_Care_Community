class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy]
  before_action :set_post, only: %i[create update]

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.save
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      render "update"
    else
      redirect_to @comment.post
    end
  end
#  def update
#   @post = Post.find(params[:post_id])
#    @comment = Comment.find(params[:id])
#    if @comment.update(comment_params)
#      flash[:success] = "Comment updated"
#      redirect_to @post
#    else
#      flash[:danger] = "Comment failed"
#      render 'edit'
#    end
#  end

    
  def destroy
    @comment.destroy!
  end
    
  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
    
  def comment_params
    params.require(:comment).permit(:body, :comment_image, :comment_image_cache, :remove_comment_image).merge(post_id: params[:post_id])
  end
end