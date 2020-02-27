class MoviesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      @movies = policy_scope(Movie.where("title ILIKE ?", "%#{params[:query]}%"))
    else
      @movies = policy_scope(Movie).all
    end
  end

  def show
    @booking = Booking.new
    @movie = Movie.find(params[:id])
    authorize @movie
    if params[:search].present?
      @filtered_sessions = @movie.movie_sessions.where("start_date >= ? AND start_date <= ?", "%#{params[:search][:date]}%", "%#{next_day}%")
      # @hour_minutes = DateTime.filtered_sessions.strftime("%H:%M")
      # @filtered_sessions = @movie.movie_sessions.where("start_date ILIKE ?", "%#{params[:search][:date]}%")
    else
      @filtered_sessions = []
    end
    @sorted_sessions = @filtered_sessions.sort_by do |ev|
      ev.start_date.strftime("%H:%M")

    end

    @average = avg_rating(@movie)
  end

  def new
    @cinema = Cinema.find(params[:cinema_id])
    @movie = Movie.new
    @movie.cinema = @cinema
    authorize @movie
  end

  def create
    @cinema = Cinema.find(params[:cinema_id])
    @movie = Movie.new(movie_params)
    @movie.cinema = @cinema
    authorize @movie
    if @movie.save
    else
      render :new
    end
  end

  def destroy
    @cinema = Cinema.find(params[:cinema_id])
    @movie = Movie.find(params[:id])
    authorize @movie
    @movie.delete
  end

  def edit
    @cinema = Cinema.find(params[:cinema_id])
    @movie = Movie.find(params[:id])
    authorize @movie
  end

  def update
    @cinema = Cinema.find(params[:cinema_id])
    @movie = Movie.find(params[:id])
    authorize @movie
    if @movie.update
      redirect_to @movie
    else
      render :edit
    end
  end

  private

  def next_day
    user_input = params[:search][:date]
    search = Date.parse(user_input)
    day_after = (search + 1).to_s
    # method should return the day after in string format
    return day_after
  end

  def avg_rating(movie)
    sum_rating = 0
    sum_reviews = 0

    movie.bookings.each do |booking|
      if booking.review
        sum_reviews += 1
        sum_rating += booking.review.rating
      end
    end
    return sum_reviews == 0 ? 0 : sum_rating / sum_reviews
  end
end
