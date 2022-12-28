class UsersController < ApplicationController
  include HTTParty

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      response = HTTParty.post("#{ENV['BACKEND_URL']}/create_user", query: { 'username': @user.username })
      redirect_to logged_index_path
    else
      redirect_to new_user_path
    end
  end

  def my_cat_facts
    response = HTTParty.get("#{ENV['BACKEND_URL']}/liked_cat_facts/#{current_user.id}")
    @liked_facts = response['body']
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
