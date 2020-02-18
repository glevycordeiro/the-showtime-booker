class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @booking.status = "active"
  end

  def create
    if @booking.status == "redeemed"
      @booking = Booking.new(booking_params)
      @booking.user = current_user
      @booking.save
      redirect_to bookings_path(@user)
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:user, :status, :movie_session)
  end
end
