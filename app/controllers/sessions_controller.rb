class SessionsController < ApplicationController
  # skip_before_action :authorized, only: [:new, :create, :welcome]
  


  def create
     @user = User.find_by(email: params[:email])
     if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to songs_path
     else
      @error =" please try again"
      render :new
      end
  end 


def destroy
 session.clear
  redirect_to song_path
end 

private 
def auth
  request.env['omniauth.auth']
end

  def page_requires_login
  end
end