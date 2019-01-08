class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        user = User.find_by(login_params[:email])
        
    end

    def destroy
        session.destroy
        redirect_to questions_path
    end

    private 

    def login_params
        params.require(:user).permit(:email, :password)
    end
end
