class SessionsController < ApplicationController
  
  def new
    @user = User.new
  end 
  
  def create
     if request.env["omniauth.auth"]
     if @user = User.find_by(github_uid: request.env["omniauth.auth"]["uid"])
    login(@user)
   redirect_to songs_path
     else
   @user = User.new(email: request.env["omniauth.auth"]["info"]["nickname"], github_uid: request.env["omniauth.auth"]["uid"], password: SecureRandom.hex)
    @user.save
   login(@user)
   redirect_to songs_path
  end

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
