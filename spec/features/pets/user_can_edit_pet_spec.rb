require "rails_helper"

RSpec.describe "PATCH /pets/:id/edit" do
  before :each do
    @shelter_1 = Shelter.create(title: "BarkTown Dogs",
          address: "123 This Way",
          city: "Denver",
          state: "CO",
          zip: "90204")

    @pet_1 = Pet.create(name: "Rufus", 
                       image: "https://cdn.pixabay.com/photo/2018/05/07/10/48/husky-3380548_1280.jpg",
                       description: "Woof Woof",
                       age: "4",
                       sex: "male", 
                       shelter: @shelter_1
                    )
  end
  it "should allow user to edit a specific pet's information" do
    visit "/pets/#{@pet_1.id}"

    click_link "Edit"

    expect(current_path).to eq("/pets/#{@pet_1.id}/edit")

    within("#pet-edit-page") do
      within("#current-pet-details") do
        expect(page).to have_content(@pet_1.name)
        expect(page).to have_content(@pet_1.description)
        expect(page).to have_content(@pet_1.age)
        expect(page).to have_content(@pet_1.sex)
        expect(page).to have_content(@pet_1.shelter.title)
        expect(page.find("img")["src"]).to match(@pet_1.image)
      end

    
      within("#pet-edit-form") do
        fill_in "name", with: "Roxus"
        fill_in "description", with: "Bad woof"
        fill_in "age", with: 5
        fill_in "sex", with: "male"
        fill_in "image", with: "cde.jpg"
      end
    end

    click_button "Update"

    expect(current_path).to eq("/pets/#{@pet_1.id}")
    
    within("#pet-#{@pet_1.id}") do
      expect(page).to have_content("Roxus")
      expect(page).to have_content("Bad woof")
      expect(page).to have_content("5")
      expect(page).to have_content("male")
      expect(page).to have_content("BarkTown Dogs")
      expect(page.find("img")["src"]).to match("cde.jpg")
    end
  end
end