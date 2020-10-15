class SessionsController < ApplicationController
  # skip_before_action :authorized, only: [:new, :create, :welcome]
  
  def new
  
  end


  def login
    
  end

  def create
     @user = User.find_by(email: params[:email])
     if @user && @user.authenticate(params[:password])
      
        redirect_to '/welcome'
     else
        redirect_to '/login', :notice => "login unsuccessful please try again !"
     end
    end 

def welcome
end 


def destroy
  reset_session
  redirect_to '/welcome'
end 

private 
def auth
  request.env['omniauth.auth']
end

  def page_requires_login
  end
end