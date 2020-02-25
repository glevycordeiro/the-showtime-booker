class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :movie_session
  has_one :movie, through: :movie_session
  after_create :update_capacity
  has_one :review
  validate :is_sold_out?



  STATUSES = ["active", "redeemed", "cancelled", "pending"]
  validates :status, inclusion: { in: STATUSES }


    private

    def is_sold_out?
        if self.seats > self.movie_session.capacity
          self.errors[:base] << "Something went wrong, please try again"
          true
        else
          false
        end
    end

  def update_capacity
    if self.movie_session.capacity > 0
      self.movie_session.capacity = self.movie_session.capacity - self.movie_session.bookings.last.seats
      self.movie_session.save
    else
      return "Sold out!"
    end
  end
end
