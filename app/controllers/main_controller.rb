class MainController < ApplicationController
  before_action :verify_user_authentication, only: [:index]

  def home
  end
  
  def index
    @user = current_user
    response = HTTParty.get("#{ENV['BACKEND_URL']}/cat_fact")
    @fact = response['body']['fact']
  end
end
