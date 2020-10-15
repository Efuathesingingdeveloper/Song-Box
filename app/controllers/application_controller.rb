class ApplicationController < ActionController::Base
  
# before_action :authorized
helper_method :current_user
helper_method :logged_in?

def login(user)
  session[:current_user_id] = @user.id
end

private   
def current_user    
    if session[:current_user_id]
      @current_user = User.find(session[:current_user_id])  
    end
  end

    def logged_in?
        !current_user.nil?  
    end
    
    def authorized
        redirect_to '/' unless logged_in?
     end
end
