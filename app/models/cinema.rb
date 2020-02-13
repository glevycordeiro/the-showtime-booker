class Cinema < ApplicationRecord
  belongs_to :user
  has_many :movies
end
