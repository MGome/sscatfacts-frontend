class MainController < ApplicationController
  before_action :verify_user_authentication, only: [:index]

  def home
  end
  
  def index
    @user = current_user
    @get_fact_url = "#{ENV['BACKEND_URL']}/cat_fact?user_id=#{ @user.id }"
    response = HTTParty.get(@get_fact_url)
    @fact = response['body']['fact']
    @fact_id = response['body']['fact_id']
    @liked_fact = response['body']['liked_fact']
    @like_fact_url = "#{ENV['BACKEND_URL']}/like_cat_fact"
  end

  def most_popular
    response = HTTParty.get("#{ENV['BACKEND_URL']}/popular_cat_facts")
    @most_liked = response['body']
  end
end
