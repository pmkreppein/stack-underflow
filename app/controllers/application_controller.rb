class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :auth_required
    
    def current_user
        User.find(session[:id]) if logged_in?
    end
    
    def auth_required
        if !logged_in?
            redirect_to root_path
        end
    end
    
    def logged_in?
        session[:id]
    end

end
