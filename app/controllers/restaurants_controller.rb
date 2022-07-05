class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :destroy, :edit, :update, :toggle_favorite]

  def index
    # @favorites = []
    @restaurants = Restaurant.all
    @restaurants.each do |restaurant|
      # @favorites << Favorite.where(restaurant: restaurant, user: current_user)
    end
  end

  def show
    @reservation = Reservation.new
    @reviews = @restaurant.reviews
    @average_rating = @reviews.average(:rating)
  end

  def new
    @restaurant = Restaurant.new
    @categories = Category.all
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path
  end

  def edit
    @categories = Category.all
  end

  def update
    @restaurant.update(restaurant_params)
    redirect_to restaurant_path(@restaurant)
  end

  def toggle_favorite
    current_user.favorited?(@restaurant) ? current_user.unfavorite(@restaurant) : current_user.favorite(@restaurant)
    redirect_to restaurants_path
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :description, :category_id)
  end

end
