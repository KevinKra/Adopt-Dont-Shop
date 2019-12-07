require "rails_helper"

RSpec.describe "GET /shelters/:id" do
  before :each do
    @shelter_1 = Shelter.create(title: "Big Woof")
    @shelter_2 = Shelter.create(title: "Hounds Pound")
  end

  it "should display one shelter per id" do
    visit "/shelter/#{@shelter_1.id}"

    expect(page).to have_content(@shelter_1.title)
    expect(page).to have_content(@shelter_1.address)
    expect(page).to have_content(@shelter_1.city)
    expect(page).to have_content(@shelter_1.state)
    expect(page).to have_content(@shelter_1.zip)

    expect(page).to_not have_content(@shelter_2.title)
    expect(page).to_not have_content(@shelter_2.address)
    expect(page).to_not have_content(@shelter_2.city)
    expect(page).to_not have_content(@shelter_2.state)
    expect(page).to_not have_content(@shelter_2.zip)
  end
end