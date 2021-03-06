class SessionsController < ApplicationController
  def new 
  end 

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user
    else
      flash[:message] = "Invalid credentials. Please try with another username and/or password."
      redirect_to login_path
    end
  end 

  def destroy
    session.delete :user_id
    redirect_to '/login'
  end 
end 