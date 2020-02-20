class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :movie_session

  STATUSES = ["active", "redeemed", "cancelled"]
  validates :status, inclusion: { in: STATUSES }
end
