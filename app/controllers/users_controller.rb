class UsersController < ApplicationController
  skip_before_action :require_sign_in!

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path
    else
      render :new, notice: "Failed to signin"
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :account,
      :email,
      :password,
      :password_confirmation
    )
  end
end