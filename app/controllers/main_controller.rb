class MainController < ApplicationController
  before_action :verify_user_authentication, only: [:index]

  def home
  end
  
  def index
    @user = current_user
    @get_fact_url = "#{ENV['BACKEND_URL']}/cat_fact"
    response = HTTParty.get(@get_fact_url)
    @fact = response['body']['fact']
    @fact_id = response['body']['fact_id']
    @like_fact_url = "#{ENV['BACKEND_URL']}/like_cat_fact"
  end
end
