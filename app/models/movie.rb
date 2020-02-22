class Movie < ApplicationRecord
  belongs_to :cinema
  has_many :movie_sessions, dependent: :destroy
  has_many :bookings, through: :movie_sessions
  has_many :reviews, through: :bookings
end
