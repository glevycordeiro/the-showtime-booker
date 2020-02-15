class MoviesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @movies = policy_scope(Movie).all
  end

  def show
    @movie = Movie.find(params[:id])
    authorize @movie
    if params[:search].present?
      @filtered_sessions = @movie.movie_sessions.where("start_date >= ? AND start_date <= ?", "%#{params[:search][:date]}%", "%#{next_day}%")
      # @hour_minutes = DateTime.filtered_sessions.strftime("%H:%M")
      # @filtered_sessions = @movie.movie_sessions.where("start_date ILIKE ?", "%#{params[:search][:date]}%")
    else
      @filtered_sessions = []
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
end
