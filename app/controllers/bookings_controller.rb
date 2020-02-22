class BookingsController < ApplicationController
  #before_action :check_if_redeem

  def show
      movie_id = 1

    @movie = Movie.find(params[movie_id])
    @movie_session = MovieSession.find(params[:movie_session_id])
    authorize @booking
    authorize @movie_session
  end

  def create

    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.status = "active"
    authorize @booking
    @booking.save
    authorize @movie_session
    redirect_to bookings_path(@user)
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
    params.require(:booking).permit(:user, :status, :movie_session_id)
  end

  def check_if_redeem
    Booking.all.each do |booking|
      if booking.start_date > Y
        @booking.status = "redeemed"
      end
    end
  end
end
