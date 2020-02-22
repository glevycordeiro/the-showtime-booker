class MovieSessionsController < ApplicationController
  def index
    @movie_sessions = MovieSession.all
  end

  def new
    @movie_session = MovieSession.new(status: true)
    authorize @movie_session
  end

  def create
    @movie_session = MovieSession.new(movie_session_params)
    authorize @movie_session

    if @movie_session.save
      redirect_to movies_path
    else
      render :new
    end
    @booking = Booking.new
    raise
    @available_seats = params[:capacity] - @movie_session.booking.length
  end

  def edit
    @movie_session = MovieSession.find(params[:id])
  end

  def update
    @movie_session = MovieSession.find(params[:id])
    @movie_session.update(params[:movie_session])
  end

  private

  def movie_session_params
    params.require(:movie_session).permit(:start_time, :start_date, :end_date, :movie_id, :capacity, :status)
  end
end
