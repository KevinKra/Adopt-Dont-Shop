require "rails_helper"

RSpec.describe "GET /shelters/new" do
  it "allows the user to create a new shelter" do
    visit "/shelters"

    click_link "Create New Shelter"

    expect(current_path).to eq("/shelters/new")

    fill_in "Title", with: "Pet Sanctuary"
    fill_in "Address", with: "1305 East Moore Rd."
    fill_in "City", with: "Detroit"
    fill_in "State", with: "MI"
    fill_in "Zip", with: 48022

    click_button "Submit"

    expect(current_path).to eq("/shelters")

    expect(page).to have_content("Pet Sanctuary")
    expect(page).to have_content("1305 East Moore Rd.")
    expect(page).to have_content("Detroit")
    expect(page).to have_content("MI")
    expect(page).to have_content("48022")
  end
end