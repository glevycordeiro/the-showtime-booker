class Movie < ApplicationRecord
  belongs_to :cinema
  has_many :movie_sessions, dependent: :destroy
end
