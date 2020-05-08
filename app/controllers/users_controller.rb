class UsersController < ApplicationController

  before_action :require_authorization, except: [:new, :create]

  def show 
    find_user
    current_user
  end 

  def new 
    @user = User.new
  end 

  def create
    @user = User.new(user_params)

    if @user.save 
      session[:user_id] = @user.id
      redirect_to user_path(@user) 
    else 
      render :new 
    end 
  end 

  def edit 
    find_user
  end 

  def update
    find_user
    
    if @user.update(user_params)
      redirect_to @user 
    else 
      render :edit 
    end 
  end 

  private 

  def require_authorization
    find_user
    if !(current_user.id == @user.id)
      redirect_to user_path(current_user)
      flash[:message] = "You cannot view another user's account... sorry, creep!"
    end 
  end

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :email, :password, :password_confirmation)
  end 

  def find_user
    @user = User.find(params[:id])
  end 
end 