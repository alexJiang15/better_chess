class UsersController < ApplicationController
  
  def new
    @user = User.new    
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "user created"
      redirect_to users_path
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = 'user updated'
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
  end
  
  def index
    @users = User.all.order(:name)    
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = 'user deleted'
    redirect_to users_path
  end
  
  private
  
  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation, :karma, :last_logged_in)
  end
  
end
