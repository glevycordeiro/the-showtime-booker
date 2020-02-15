class MoviesController < ApplicationController
skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @movies = policy_scope(Movie).all
  end

  def show
    @movie = Movie.find(params[:id])
    authorize @movie
  end

end
