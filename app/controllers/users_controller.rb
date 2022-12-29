class UsersController < ApplicationController
  include HTTParty
  before_action :set_user_information, only: %i[my_cat_facts]

  def new
    @errors = params[:errors]
  end

  def create
    response = HTTParty.post("#{ENV['BACKEND_URL']}/create_user", query: { 'username': params[:username] })
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
end
