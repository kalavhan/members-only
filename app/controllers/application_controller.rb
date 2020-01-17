class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def log_in(user)
    user.remember
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
  end

  def sign_out
    cookies.delete(:remember_token)
    self.current_user = nil
  end
end
