class AddSheltersToPets < ActiveRecord::Migration[6.0]
  def change
    add_reference :pets, :shelter, foreign_key: true
  end
end
