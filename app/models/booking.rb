class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :movie_session
end
