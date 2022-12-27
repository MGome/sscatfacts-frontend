class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    redirect_to login_path unless @user

    session[:user_id] = @user.id
    return redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_user_path
  end
end
