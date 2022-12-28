class SessionsController < ApplicationController
  def new
  end

  def create
    response = HTTParty.get("#{ENV['BACKEND_URL']}/find_user", query: { 'username': params[:username] })
    return redirect_to login_path if response['errors'].present?

    session[:user_credentials] = response['body']
    redirect_to logged_index_path
  end

  def destroy
    session[:user_credentials] = nil
    redirect_to root_path
  end
end
