class ReviewsController < ApplicationController

  def create
    @reservation = Reservation.find(params[:reservation_id])
    @review = Review.new(review_params)
    @review.reservation = @reservation
    if @review.save
      redirect_to restaurant_path(@reservation.restaurant)
    else
      render "reservation/show"
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
