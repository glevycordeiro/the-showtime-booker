class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :movie_session
  has_one :movie, through: :movie_session
  has_one :review

  STATUSES = ["active", "redeemed", "cancelled"]
  validates :status, inclusion: { in: STATUSES }
end
