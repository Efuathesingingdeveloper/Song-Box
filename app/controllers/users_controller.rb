class UsersController < ApplicationController
  # skip_before_action :authorized, only: [:new, :create]

  def new
    @user = User.new
  end

  def create

    @user = User.new(user_params)
    
    if @user.save
      session[:user_id] = @user.id
      redirect_to songs_path
   else 
    redirect_to '/'
  end
end

  private
  def user_params 
    params.require(:user).permit(:password, :email)
  end
end
