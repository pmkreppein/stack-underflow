class UsersController < ApplicationController
  def create
    @user = User.create(user_params)
    return render 'new' unless @user.save

    session[:user_id] = @user.id
    redirect_to questions_path
  end

  def new
    @user = User.new
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
