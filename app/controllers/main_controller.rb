class MainController < ApplicationController
  before_action :verify_user_authentication, only: %i[index most_popular]
  before_action :set_user_information, only: %i[index most_popular]

  def home
  end

  def index
    @get_fact_url = "#{ENV['BACKEND_URL']}/cat_fact?user_id=#{@user_id}"
    response = HTTParty.get(@get_fact_url)
    @fact, @fact_id, @liked_fact = response['body'].values_at('fact', 'fact_id', 'liked_fact')
    @like_fact_url = "#{ENV['BACKEND_URL']}/like_cat_fact"
  end

  def most_popular
    response = HTTParty.get("#{ENV['BACKEND_URL']}/popular_cat_facts")
    @most_liked = response['body']
  end
end
