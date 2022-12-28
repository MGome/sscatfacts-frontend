class ApplicationController < ActionController::Base
  def current_user
    ActiveSupport::JSON.decode(session[:user_credentials]) if session[:user_credentials]
  end

  def authenticated_user?
    !current_user.nil?
  end

  def verify_user_authentication
    return redirect_to login_path unless authenticated_user?
  end
end
