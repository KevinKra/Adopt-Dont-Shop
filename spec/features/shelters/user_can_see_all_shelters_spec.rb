require "rails_helper"

RSpec.describe "shelter index page" do
  before :each do
    @shelter_1 = Shelter.create(title: "Big Woof")
    @shelter_2 = Shelter.create(title: "Hounds Pound")
  end

  it "displays all of the shelters" do
    visit "/shelters"

    expect(page).to have_content(@shelter_1.title)
    expect(page).to have_content(@shelter_2.title)
  end
end