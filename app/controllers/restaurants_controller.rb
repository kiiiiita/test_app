class RestaurantsController < ApplicationController
  def new
    @restaurant = Restaurant.new
    @restaurant.tags.build
  end

  def index
    @restaurants = current_user.restaurants
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to action: 'index'
    else
      @errors = @restaurant.errors
      render :new
    end
  end

  private

    def restaurant_params
      params.require(:restaurant).permit(:user_id, :name, :url, :visit_date, tags_attributes: :name)
    end
end
