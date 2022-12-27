class MainController < ApplicationController
  before_action :verify_user_authentication, only: [:index]

  def home
  end
  
  def index
    @user = current_user
  end
end
