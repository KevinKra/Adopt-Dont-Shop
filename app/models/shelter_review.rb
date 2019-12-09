class ShelterReview < ApplicationRecord
  belongs_to :shelter
  validates_presence_of :title
  validates_presence_of :rating
  validates_presence_of :review
  validates :rating, :inclusion => 1..5
end