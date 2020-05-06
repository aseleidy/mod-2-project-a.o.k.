class ApplicationController < ActionController::Base
  def current_user 
    if session[:user_id]
      User.find_by(id: session[:user_id])
    end 
  end  

  def logged_in?
    !!current_user
  end 
end
