require "rails_helper"

RSpec.describe "User can leave reviews for shelters" do
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

  it "should be able to leave a review for a shelter at shelter/:id" do
    visit "shelters/#{@shelter_1.id}"

    click_link "Write Review"

    expect(current_path).to eq("shelters/#{@shelter_1.id}/write_review")

    fill_in "Title", with: "Great Experience"
    fill_in "Rating", with: 5
    fill_in "Review", with: "They were super friendly and really cared about their pets!"
    fill_in "Photo", with: "myNewPup.jpg"

    click_button "Submit"

    expect(current_path).to eq("shelters/#{@shelter_1.id}")

    expect(page).to have_content("Great Experience")
    expect(page).to have_content("5/5")
    expect(page).to have_content("They were super friendly and really cared about their pets!")
    expect(page.find("img")["src"]).to match("myNewPup.jpg")
  end
end