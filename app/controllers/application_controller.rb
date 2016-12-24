class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  #make available to our views
  helper_method :current_user, :logged_in?
  
  
  def current_user
    #return current user if user id is logged in
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end 
  
  def logged_in?
    #returns true if user is logged in
    !!current_user
  end 
  
  def require_user
    if !logged_in?
      #redirect the user
      flash[:danger] = "You must be logged in to perform"
      redirect_to root_path
    end 
  end 
  
end


