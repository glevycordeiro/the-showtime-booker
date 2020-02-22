class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :movie_session
  has_one :movie, through: :movie_session
  after_create :update_capacity
  has_one :review

  STATUSES = ["active", "redeemed", "cancelled"]
  validates :status, inclusion: { in: STATUSES }

  def update_capacity
    if self.movie_session.capacity > 0
      self.movie_session.capacity = self.movie_session.capacity - self.movie_session.bookings.last.seats
      self.movie_session.save
    else
      return "Sold out!"
    end
  end
end
