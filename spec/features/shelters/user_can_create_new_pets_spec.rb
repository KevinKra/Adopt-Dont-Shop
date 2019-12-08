require "rails_helper"

RSpec.describe "POST /shelters/:shelter_id/pets/new" do
  before :each do
    @shelter_1 = Shelter.create(title: "BarkTown Dogs",
          address: "123 This Way",
          city: "Denver",
          state: "CO",
          zip: "90204")

    @shelter_2 = Shelter.create(title: "Arrow Pups",
        address: "5608 N Eaton St.",
        city: "Chicago",
        state: "IL",
        zip: "80234")

    @pet_1 = Pet.create(name: "Rufus", 
                       image: "https://cdn.pixabay.com/photo/2018/05/07/10/48/husky-3380548_1280.jpg",
                       age: "4",
                       sex: "male", 
                       shelter: @shelter_1
                    )
    @pet_2 = Pet.create(name: "Peter", 
                       image: "https://cdn.pixabay.com/photo/2016/05/09/10/42/weimaraner-1381186_1280.jpg",
                       age: "1",
                       sex: "male", 
                       shelter: @shelter_2
                    )
  end

  it "should allow the user to create new pets for shelters" do
    visit "/shelters/#{@shelter_1.id}/pets"

    click_link "Add Pet"

    expect(current_path).to eq("/shelters/#{@shelter_1.id}/pets/new")

    within("#pet-creation-form") do
      fill_in "name", with: "Taco"
      fill_in "image", with: "abc.jpg"
      fill_in "description", with: "Though feeble, Taco is a good boy."
      fill_in "age", with: 17
      fill_in "sex", with: "male"
    end

    click_button "Add"

    expect(current_path).to eq("/shelters/#{@shelter_1.id}/pets")

    within("#pet-#{@shelter_1.pets.last.id}") do
      expect(page).to have_content("Taco")
      expect(page.find("img")["src"]).to match("abc.jpg")
      expect(page).to have_content("Though feeble, Taco is a good boy.")
      expect(page).to have_content("17")
    end
    expect(@shelter_1.pets.count).to eq(2)
  end
end