class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :movie_session
  has_one :movie, through: :movie_session
  after_create :update_capacity
  has_one :review

  STATUSES = ["active", "redeemed", "cancelled", "pending"]
  validates :status, inclusion: { in: STATUSES }

  def update_capacity
    self.movie_session.capacity = self.movie_session.capacity - self.movie_session.bookings.last.seats
    self.movie_session.save
  end
end
