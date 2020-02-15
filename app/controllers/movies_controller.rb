class MoviesController < ApplicationController
skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @movies = policy_scope(Movie).all
  end

  def show
    @movie = Movie.find(params[:id])
    authorize @movie
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
    if  @movie.save
      redirect_to "#"("#")
    else
      render :new
    end
  end

  def destroy
    @cinema = Cinema.find(params[:cinema_id])
    authorize @movie
    @movie.delete
  end
end
