require "rails_helper"

RSpec.describe "Usability features for shelter's index page" do
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
  it "should allow user to edit the shelter's info" do
    visit "/shelters"

    within("#shelter-#{@shelter_1.id}") do
      click_link "Edit"
    end

    expect(current_path).to eq("/shelters/#{@shelter_1.id}/edit")
  end

  it "should allow user to delete the shelter" do
    visit "/shelters"
    expect(page).to have_content("BarkTown Dogs")

    within("#shelter-#{@shelter_1.id}") do
      click_link "Delete"
    end

    expect(current_path).to eq("/shelters")

    expect(page).to_not have_content("BarkTown Dogs")
  end

  it "should allow user to visit the shelter's show page from /shelters" do
    visit "/shelters"

    click_link "#{@shelter_1.title}"

    expect(current_path).to eq("/shelters/#{@shelter_1.id}")
  end

  it "should allow user to visit the shelter's pets index page from /shelters/:id" do
    visit "/shelters/#{@shelter_1.id}"

    click_link "View Pets"

    expect(current_path).to eq("/shelters/#{@shelter_1.id}/pets")
  end

  it "should allow user to visit the shelters index page from /pets" do
    visit "/pets"

    within("#pet-#{@pet_1.id}") do
      click_link "#{@pet_1.shelter.title}"
    end

    expect(current_path).to eq("/shelters/#{@shelter_1.id}")
  end

  it "should allow user to visit the shelters index page from /pets/:id" do
    visit "/pets/#{@pet_1.id}"

    within("#pet-#{@pet_1.id}") do
      click_link "#{@pet_1.shelter.title}"
    end

    expect(current_path).to eq("/shelters/#{@shelter_1.id}")
  end

  it "should allow me to visit the pets index via navbar link" do
    visit "/pets"

    within("#main-navbar") do
      click_link "Pets"
    end

    expect(current_path).to eq("/pets")
  end

end