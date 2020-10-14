module ApplicationHelper
    module SessionsHelper
        private  
         
        def login(user)
            session[:current_user_id] = @user.id
          end

def current_user    
    if session[:current_user_id]
      @current_user = User.find(session[:current_user_id])  
    end
  end

    def logged_in?
        !current_user.nil?  
    end
    
    def authorized
        redirect_to '/welcome' unless logged_in?
     end
 end
end 
