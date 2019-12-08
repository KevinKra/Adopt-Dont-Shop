class AddDescriptionAdoptableToPets < ActiveRecord::Migration[6.0]
  def change
    add_column :pets, :description, :string
    add_column :pets, :adoptable, :bool, default: true
  end
end
