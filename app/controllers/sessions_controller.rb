class SessionsController < ApplicationController
  # skip_before_action :authorized, only: [:new, :create, :welcome]
  
  def new
    @user = User.new
  end 
  
  def create
    # if auth_hash = request.env["omniauth.auth"]
    #   oauth_email = request.env["omniauth.auth"]["info"]["email"]
      @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])
        
        session[:user_id] = @user.id
      redirect_to songs_path
     else
      @error =" please try again"
      render :new
      end
    end 
  # end 

  def welcome 
   
  end 


def destroy
 session.clear
redirect_to songs_path
end 

private 
def auth
  request.env['omniauth.auth']
end
end
