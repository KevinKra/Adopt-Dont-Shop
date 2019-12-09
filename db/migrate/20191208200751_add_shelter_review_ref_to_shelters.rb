class AddShelterReviewRefToShelters < ActiveRecord::Migration[6.0]
  def change
    add_reference :shelter_reviews, :shelter, null: false, foreign_key: true
  end
end
