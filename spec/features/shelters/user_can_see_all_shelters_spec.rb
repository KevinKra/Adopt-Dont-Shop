require "rails_helper"

RSpec.describe "shelter index page" do
  before :each do
    @shelter_1.name = Shelter.create(name: "Big Woof")
    @shelter_1.name = Shelter.create(name: "Hounds Pound")
  end

  it "displays all of the shelters" do
    visit "/"

    expect(page).to have_content(@shelter_1.name)
    expect(page).to have_content(@shelter_2.name)
  end
end