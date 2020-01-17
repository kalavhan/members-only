class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  attr_writer :current_user

  def log_in(user)
    user.remember
    cookies.permanent[:remember_token] = user.remember_token
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by(remember_token: cookies[:remember_token])
  end

  def sign_out
    cookies.delete(:remember_token)
    @current_user = nil
  end

end
