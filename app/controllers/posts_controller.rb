class PostsController < ApplicationController


  def index 
    @posts = Post.all
  end

  def show

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save 
      @post.user_id = params[:user_id]
      redirect_to @post 
    else
      render new_user_post_path
    end
  end

  def edit

  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render edit_user_post_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:user, :post_title, :post_body)
  end

end
