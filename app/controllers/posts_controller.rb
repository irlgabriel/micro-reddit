class PostsController < ApplicationController


  def index 
    @posts = Post.all
    @user = User.find(params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @posts = Post.all
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.build(post_params)
    if @post.save 
      redirect_to user_post_path(@user, @post)
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
    if @post.update(post_params)
      redirect_to user_post_url(@user, @post)
    else
      render edit_user_post_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:user, :post_title, :post_body)
  end

end
