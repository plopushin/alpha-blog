class SessionsController < ApplicationController
  
  def new 
  end 
  
  def create
    #render 'new'
    #downcase to keep all charactesr lowercase
    
    user = User.find_by(email: params[:session][:email].downcase)
    #verify email is valid
    if user && user.authenticate(params[:session][:password])
      #save the user_id in the session, and used for requests
      session[:user_id] = user.id
      flash[:success] = "You have successfully logged in"
      redirect_to user_path(user)
    else 
      #render new if not there. 
      #tell the user that something is wrong
      #flash.now -> Message persits on the page
      flash.now[:danger] = "There was something wrong with your login info"
      render 'new'
    end 
    
    
  end 
  
  #destroy is log out
  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end 
  
end 