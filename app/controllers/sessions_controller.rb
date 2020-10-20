class SessionsController < ApplicationController
  
  def new
    @user = User.new
  end 
  
  def create
    if request.env["omniauth.auth"]
    @user = User.find_by(github_uid: request.env["omniauth.auth"]["uid"])
    if @user.nil?
   @user = User.create(email: request.env["omniauth.auth"]["info"]["nickname"], github_uid: request.env["omniauth.auth"]["uid"])
    end
    login(@user)
    redirect_to songs_path
  else
   @user = User.find_by(email: params[:email])
   if !@user
    @error =" Account not found"
    render :new
   elsif !@user.authenticate(params[:password])
    @error =" please try again"
        render :new 
       
     else
      login(@user)
      redirect_to songs_path
      end
    end 
  end 

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
