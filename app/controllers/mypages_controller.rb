class MypagesController < ApplicationController
  def show
    @user = current_user
    @blogs = current_user.blogs
  end
end
