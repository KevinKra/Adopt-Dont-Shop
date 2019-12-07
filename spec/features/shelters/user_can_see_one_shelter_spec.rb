require "rails_helper"

RSpec.describe "GET /shelters/:id" do
  before :each do
    @shelter_1 = Shelter.create(
                                title: "Big Woof",
                                city: "Denver",
                                state: "CO",
                                address: "515 Clarke Rd.",
                                zip: 32081
                               )
    @shelter_2 = Shelter.create(
                                title: "Hounds Home",
                                city: "Chicago",
                                state: "IL",
                                address: "4147 18th St.",
                                zip: 43088
                               )
  end

  it "should display one shelter per id" do
    visit "/shelters/#{@shelter_1.id}"

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