class FavoritesController < ApplicationController
  before_action :set_restaurant, only: [:create, :destroy]

  def create
    @favorite = Favorite.new(user: @user, restaurant: @restaurant)
    if @favorite.save
      redirect_to restaurants_path
    else
      redirect_to restaurants_path
    end
  end

  def destroy
    @favorite = Favorite.where(user: @user, restaurant: @restaurant)
    @favorite.destroy_all
    redirect_to restaurants_path
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
    @user = current_user
  end

  def favorite_params
    params.require(:favorite).permit(:user_id, :restaurant_id)
  end

end
