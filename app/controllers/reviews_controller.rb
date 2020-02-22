class ReviewsController < ApplicationController
  def new
    @booking = Booking.find(params[:booking_id])
    # @user = User.find(params[:user_id])
    @review = Review.new
    authorize @review
    @review.booking = @booking
    # @review.user = @user
  end

  def create
    @booking = Booking.find(params[:booking_id])
    # @user = User.find(params[:user_id])
    @review = Review.new(review_params)
    @review.booking = @booking
    # @review.user = @user
     authorize @review
    if @review.save
      redirect_to new_review_path
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end






  # def create
  #   @review = Review.new(review_params)
  #   @review.user = current_user
  #   if @review.save
  #     redirect_to new_review_path
  #   else
  #     flash[:alert] = "Something went wrong."
  #     render :new
  #   end
  # end

  private

  def review_params
    params.require(:review).permit(:description, :rating, :user_id, :booking_id)
  end
end
