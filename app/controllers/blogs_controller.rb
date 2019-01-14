class BlogsController < ApplicationController
  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to mypage_path(current_user)
    else
      render :new, notice: "Failed to blog"
    end
  end

  private

  def blog_params
    params.require(:blog).permit(
      :user_id,
      :title,
      :contents
    )
  end
end
