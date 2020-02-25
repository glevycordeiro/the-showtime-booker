class Cinema < ApplicationRecord
  belongs_to :user
  has_many :movies, dependent: :destroy
  has_many :movie_sessions, through: :movies
end
