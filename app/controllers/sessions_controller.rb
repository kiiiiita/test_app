class SessionsController < ApplicationController
  skip_before_action :require_sign_in!

  def new
  end

  def create
    user = login(params[:account], params[:password], params[:remember_me])
    if user
      redirect_back_or_to mypage_path(user), notice: "Logged in!"
    else
      flash.now[:alert] = "Failed to login"
      render :new
    end
  end

  def destroy
    logout
    redirect_to login_path, notice: "Logged out!"
  end
end
