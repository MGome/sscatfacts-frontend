class MainController < ApplicationController
  before_action :verify_user_authentication, only: [:index, :most_popular]

  def home
  end
  
  def index
    @user_id, @username = current_user.values_at('id', 'username')
    @get_fact_url = "#{ENV['BACKEND_URL']}/cat_fact?user_id=#{ @user_id }"
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
