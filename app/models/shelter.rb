class Shelter < ApplicationRecord
  has_many :pets, dependent: :delete_all
  has_many :shelterReviews, dependent: :delete_all
end