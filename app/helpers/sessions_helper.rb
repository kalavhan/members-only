module SessionsHelper
  def logged_in?
    !current_user.nil?
  end

  attr_writer :current_user

  def current_user
    @current_user ||= User.find_by(remember_token: cookies[:remember_token])
  end
end
