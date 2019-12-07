require "rails_helper"

RSpec.describe "DELETE /shelter/:id" do
  before :each do
    @shelter_1 = Shelter.create(
      title: "Big Woof",
      city: "Denver",
      state: "CO",
      address: "515 Clarke Rd.",
      zip: 32081
     )
  end

  it "allows the user to delete shelters" do
    visit "/shelters/#{@shelter_1.id}"

    click_button "Delete"

    expect(current_path).to eq("/shelters")
    expect(page).to_not have_content("Big Woof")
  end
end