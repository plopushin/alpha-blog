class PagesController < ApplicationController

def home
  #go right to articles path if clicking home when logged in.
  redirect_to articles_path if logged_in?
end 

def about 
end 

end 