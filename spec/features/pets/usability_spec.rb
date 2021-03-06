require "rails_helper"

RSpec.describe "Usability features for pets" do
  before :each do
    @shelter_1 = Shelter.create(
        title: "BarkTown Dogs",
        address: "123 This Way",
        city: "Denver",
        state: "CO",
        zip: "90204"
      )

    @shelter_2 = Shelter.create(
        title: "Arrow Pups",
        address: "5608 N Eaton St.",
        city: "Chicago",
        state: "IL",
        zip: "80234"
      )

    @pet_1 = Pet.create(
        name: "Rufus", 
        image: "https://cdn.pixabay.com/photo/2018/05/07/10/48/husky-3380548_1280.jpg",
        age: "4",
        sex: "male", 
        shelter: @shelter_1
      )
    @pet_2 = Pet.create(
        name: "Peter", 
        image: "https://cdn.pixabay.com/photo/2016/05/09/10/42/weimaraner-1381186_1280.jpg",
        age: "1",
        sex: "male", 
        shelter: @shelter_1
    )
  end

  it "should allow user to edit their pet from index page" do
    visit "/pets"

    within("#pet-#{@pet_1.id}") do
      click_link "Edit"
    end

    expect(current_path).to eq("/pets/#{@pet_1.id}/edit")
  end

  it "should allow user to delete their pet from index page" do
    visit "/pets"
    expect(page).to have_content("Rufus")

    within("#pet-#{@pet_1.id}") do
      click_link "Delete"
    end

    expect(current_path).to eq("/pets")
    expect(page).to_not have_content("Rufus")
  end

  it "should allow user to visit the pets index page from /pets" do
    visit "/pets"

    within("#pet-#{@pet_1.id}") do
      click_link "#{@pet_1.name}"
    end

    expect(current_path).to eq("/pets/#{@pet_1.id}")
  end

  it "should allow user to visit the pets index page from /shelters/:id/pets" do
    visit "/shelters/#{@shelter_1.id}/pets"

    within("#pet-#{@pet_1.id}") do
      click_link "#{@pet_1.name}"
    end

    expect(current_path).to eq("/pets/#{@pet_1.id}")
  end

  it "should allow me to visit the shelters index via navbar link" do
    visit "/shelters"

    within("#main-navbar") do
      click_link "Shelters"
    end

    expect(current_path).to eq("/shelters")
  end
end