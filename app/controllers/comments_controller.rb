class CommentsController < ApplicationController
  before_action :require_login
  before_action :set_comment, only: %i[edit update destroy]
#  before_action :set_post, only: %i[create edit update destroy]

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.save
  end

  def edit

  end

  def update
#    @comment = current_user.comments.build(comment_params)
#    if @comment.save
    if @comment.update(comment_params)
      redirect_to post_path(@comment.post_id), success: t('.success', item: Comment.model_name.human)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy!
  end
    
  private

  def set_post
    @post = Post.find_by(id: params[:post_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
    
  def comment_params
    params.require(:comment).permit(:body, :comment_image, :comment_image_cache, :remove_comment_image, :post_id).merge(post_id: params[:post_id])
  end
end