class UsersController < ApplicationController
  
  def new
    @user = User.new    
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = 'user created'
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
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
    @users = User.order(:first).all
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = 'user deleted'
    redirect_to users_path
  end
  
  # def confirm_email
  #   # PARAMS[:hash] => confirmation_hash for an email address
  #   user = User.find_by(confirmation_hash: params[:hash])
  #   if user
  #     user.confirmed = true
  #     user.save
  #     sign_in(user)
  #     redirect_to user
  #   else
  #     flash[:error] = 'could not confirm this email'
  #     redirect_to root_path
  #   end
  # end
  
  private
  
  def user_params
    params
      .require(:user)
      .permit(:first, :last, :email, :password, :password_confirmation, :karma)
  end
  
end
