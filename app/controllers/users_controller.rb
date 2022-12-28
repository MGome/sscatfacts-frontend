class UsersController < ApplicationController
  include HTTParty

  def new
    @user = User.new
    @errors = params[:errors]
  end

  def create
    response = HTTParty.post("#{ENV['BACKEND_URL']}/create_user", query: { 'username': user_params[:username] })
    if response['errors'].blank?
      session[:user_credentials] = response['body']
      redirect_to logged_index_path
    else
      redirect_to new_user_path(errors: response['errors'])
    end
  end

  def my_cat_facts
    user_id = current_user['id']
    response = HTTParty.get("#{ENV['BACKEND_URL']}/liked_cat_facts/#{user_id}")
    @liked_facts = response['body']
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
