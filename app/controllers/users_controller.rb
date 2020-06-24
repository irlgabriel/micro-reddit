class UsersController < ApplicationController

  def new 
    @user = User.new
  end

  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else 
      render :new
    end
  end

  def edit
    
  end

  def update
    if user.update(user_params)
      redirect_to @user
    else 
      render edit_user_path
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
