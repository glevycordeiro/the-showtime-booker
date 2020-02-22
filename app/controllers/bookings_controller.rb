class BookingsController < ApplicationController
  #before_action :check_if_redeem

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def create

    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.status = "active"
    authorize @booking
    if @booking.save
    redirect_to @booking
    else
      render 'movies/show'
    end
  end

  def edit
    @bookings = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.status = "cancelled"
  end

  private

  def booking_params
    params.require(:booking).permit(:user, :status, :movie_session_id,:seats)
  end

  def check_if_redeem
    Booking.all.each do |booking|
      if booking.start_date > Y
        @booking.status = "redeemed"
      end
    end
  end
end
