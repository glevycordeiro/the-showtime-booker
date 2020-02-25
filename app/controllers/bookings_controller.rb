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
    @movie = @booking.movie_session.movie
    authorize @booking
    if @booking.save
    redirect_to @booking
    flash[:alert] = "Booking sucessful"
    else
      flash[:notice] = "Session sold out, there are only #{@booking.movie_session.capacity-@booking.seats} seats available!"
      redirect_to @movie
      #render 'movies/show'
    end
  end

  def edit
    @bookings = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.status = "cancelled"
  end

  def cancelled
    @booking = Booking.find(params[:booking])
    authorize @booking
    @booking.status = "cancelled"
    @booking.save
    redirect_to dashboard_path, notice: "movie session cancelled by your request"
  end

  private

  def booking_params
    params.require(:booking).permit(:user, :status, :movie_session_id, :seats)
  end

  def check_if_redeem
    Booking.all.each do |booking|
      if booking.start_date > Y
        @booking.status = "redeemed"
      end
    end
  end


end
