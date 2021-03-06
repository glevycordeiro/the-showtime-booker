class Review < ApplicationRecord
  belongs_to :user
  belongs_to :booking

  RATINGS = [1, 2, 3, 4, 5]
  validates :rating, inclusion: { in: RATINGS }

  def avg_review
    average(:rating)
  end
end
