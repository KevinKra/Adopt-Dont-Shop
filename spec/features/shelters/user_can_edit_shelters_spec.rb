require "rails_helper"

RSpec.describe "GET /shelters/edit" do
  before :each do
    @shelter_1 = Shelter.create(
      title: "Big Woof",
      city: "Denver",
      state: "CO",
      address: "515 Clarke Rd.",
      zip: 32081
     )
  end

  it "allows the user to edit currently existing shelters" do
    visit "/shelters/#{@shelter_1.id}"

    click_link "Edit"

    expect(current_path).to eq("/shelters/#{@shelter_1.id}/edit")

    expect(page).to have_content(@shelter_1.title)
    expect(page).to have_content(@shelter_1.address)
    expect(page).to have_content(@shelter_1.city)
    expect(page).to have_content(@shelter_1.state)
    expect(page).to have_content(@shelter_1.zip)

    fill_in "Title", with: "Oogles Pets"
    fill_in "Address", with: "155 Apache St."
    fill_in "City", with: "Austin"
    fill_in "State", with: "TX"
    fill_in "Zip", with: 44422

    click_button "Update"

    expect(current_path).to eq("/shelters/#{@shelter_1.id}")

    expect(page).to have_content("Oogles Pets")
    expect(page).to have_content("155 Apache St.")
    expect(page).to have_content("Austin")
    expect(page).to have_content("TX")
    expect(page).to have_content("44422")
    expect(page).to_not have_content(@shelter_1.title)
  end
end