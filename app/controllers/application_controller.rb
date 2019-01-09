class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :auth_required

    def current_user
        if logged_in?
            User.find(session[:user_id])
        else
            false
        end
    end

    def auth_required
        if !logged_in?
            redirect_to login_path
        end
    end

    def logged_in?
        session[:user_id]
    end

end
