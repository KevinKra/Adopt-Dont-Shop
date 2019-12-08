require "rails_helper"

RSpec.describe "GET /pets" do
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
  
  it "should display all the pets" do
    visit "/pets"

    within("#pet-#{@pet_1.id}") do
      expect(page).to have_content(@pet_1.name)
      expect(page).to have_content(@pet_1.age)
      expect(page).to have_content(@pet_1.sex)
      expect(page).to have_content(@pet_1.shelter.title)
      expect(page.find("img")['src']).to match(@pet_1.image)
    end

    within("#pet-#{@pet_2.id}") do
      expect(page).to have_content(@pet_2.name)
      expect(page).to have_content(@pet_2.age)
      expect(page).to have_content(@pet_2.sex)
      expect(page).to have_content(@pet_2.shelter.title)
      expect(page.find("img")['src']).to match(@pet_2.image)
    end

  end
end