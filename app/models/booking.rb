class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :movie_session
  has_one :movie, through: :movie_session

  STATUSES = ["active", "redeemed", "cancelled", "pending"]
  validates :status, inclusion: { in: STATUSES }
end
