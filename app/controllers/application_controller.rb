class ApplicationController < ActionController::Base
  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def authenticated_user?
    !current_user.nil?
  end

  def verify_user_authentication
    return redirect_to login_path unless authenticated_user?
  end
end
