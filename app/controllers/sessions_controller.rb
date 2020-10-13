class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]
  
  def new
  end


  def login
  end

  def create
     @user = User.find_by(username: params[:username])
     if @user && @user.authenticate(params[:password])
        sessions[:user_id] = @user.id
        redirect_to '/welcome'
     else
        redirect_to '/login'
     end
def welcome
end 


def destroy
  session.clear
end 

  def page_requires_login
  end
  end