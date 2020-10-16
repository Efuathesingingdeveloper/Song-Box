class ApplicationController < ActionController::Base
  
# before_action :authorized
helper_method :current_user
helper_method :logged_in?

def login(user)
  session[:user_id] = @user.id
end

private   
def current_user    
    if session[:current_user_id]
      @current_user = User.find(id: session[:user_id])  
    end
  end

    def logged_in?
        !current_user.nil?  
    end
    
    def require_login
        redirect_to '/' unless logged_in?
     end
end
