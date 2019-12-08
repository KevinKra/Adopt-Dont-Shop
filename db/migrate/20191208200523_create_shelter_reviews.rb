class CreateShelterReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :shelter_reviews do |t|
      t.string :title
      t.integer :rating
      t.text :review
      t.string :photo

      t.timestamps
    end
  end
end
