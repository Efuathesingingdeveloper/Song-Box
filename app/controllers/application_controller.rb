class ApplicationController < ActionController::Base

helper_method :current_user
helper_method :logged_in?

def login(user)
  session[:user_id] = @user.id
end

private   
def current_user    
  @user = User.find_by_id(session[:user_id]) if logged_in?
  end


    def logged_in?
        !!session[:user_id] 
    end
    
    def require_login
        redirect_to '/' unless logged_in?
     end
end
