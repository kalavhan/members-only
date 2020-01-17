class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    sign_out if logged_in?
    redirect_to login_path
  end
end
