class PostsController < ApplicationController
    before_action :set_post, only: %i[edit update destroy]
    skip_before_action :require_login, only: %i[index show]
  
    def index
      @posts = Post.all.includes(:user).order(created_at: :desc)
    end
  
    def new
      @post = Post.new
    end
  
    def edit
      @post = Post.find(params[:id])
    end
  
    def create
      @post = current_user.posts.build(post_params)
  
      if @post.save
        redirect_to posts_path, success: t('.success', item: Post.model_name.human)
      else
        flash.now[:danger] = t('.failure', item: Post.model_name.human)
        render :new, status: :unprocessable_entity
      end
    end
  
    def update
      @post = Post.find(params[:id])
      if @post.update(post_params)
        redirect_to post_path(@post), success: t('.success')
      else
        flash.now[:danger] = t('.failure')
        render :edit, status: :unprocessable_entity
      end
    end
  
    def destroy
      @post = Post.find(params[:id])
      @post.destroy!
      redirect_to posts_path, success: t('.success'), status: :see_other
    end
  
    def post_params
      params.require(:post).permit(:post_type, :body, :post_image, :post_image_cache)
    end
  
    def set_post
      @post = current_user.posts.find(params[:id])
    end
  end