require "rails_helper"

RSpec.describe "DELETE /pets/:id" do
  before :each do
    @shelter_1 = Shelter.create(
      title: "Big Woof",
      city: "Denver",
      state: "CO",
      address: "515 Clarke Rd.",
      zip: 32081
    )

    @pet_1 = Pet.create(
      name: "Rufus", 
      image: "https://cdn.pixabay.com/photo/2018/05/07/10/48/husky-3380548_1280.jpg",
      description: "wow cool",
      age: "4",
      sex: "male", 
      shelter: @shelter_1
    )

    @pet_2 = Pet.create(
      name: "Ocor", 
      image: "https://cdn.pixabay.com/photo/2018/05/07/10/48/husky-3380548_1280.jpg",
      description: "wow cool",
      age: "3",
      sex: "female", 
      shelter: @shelter_1
    )
  end

  it "allows the user to delete the pet" do
    expect(@shelter_1.pets.count).to eq(2)
    visit "pets/#{@pet_1.id}"

    click_link "Delete"

    expect(@shelter_1.pets.count).to eq(1)
    expect(current_path).to eq("/pets")
    expect(page).not_to have_content("Rufus")
    expect(page).to have_content(@pet_2.name)
  end
end