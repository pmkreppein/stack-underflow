class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if auth_hash = request.env['omniauth.auth']
      user = User.from_omniauth(auth_hash)
      session[:user_id] = user.id
      redirect_to questions_path
    else
      user = User.find_by_email(login_params[:email])
      if user && user.authenticate(login_params[:password])
        session[:user_id] = user.id
        redirect_to questions_path
      else
        redirect_to '/login'
    end
  end
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
