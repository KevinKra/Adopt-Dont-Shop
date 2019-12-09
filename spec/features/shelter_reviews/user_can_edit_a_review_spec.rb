require "rails_helper"

RSpec.describe "User can edit a review" do
  before :each do
    @shelter_1 = Shelter.create!(
      title: "BarkTown Dogs",
      address: "123 This Way",
      city: "Denver",
      state: "CO",
      zip: "90204"
    )

    @pet_1 = Pet.create!(
      name: "Rufus", 
      image: "https://cdn.pixabay.com/photo/2018/05/07/10/48/husky-3380548_1280.jpg",
      age: "4",
      sex: "male", 
      shelter: @shelter_1
    )
    
    @review_1 = ShelterReview.create!(
      title: "Great Service",
      rating: 5,
      photo: "abc.jpg",
      review: "They did swell! Loved it!",
      shelter: @shelter_1
    )
  end

  it "should allow user to edit an existing review for a shelter" do
    visit "/shelters/#{@shelter_1.id}"

    within("#review-#{@shelter_1.shelterReviews.first.id}") do
      click_link "Edit"
    end

    expect(current_path).to eq("/shelters/#{@shelter_1.id}/reviews/#{@review_1.id}/edit")

    expect(page).to have_content(@review_1.title)
    expect(page).to have_content(@review_1.rating)
    expect(page).to have_content(@review_1.photo)
    expect(page).to have_content(@review_1.review)

    within("#review-#{@review_1.id}-edit") do
      fill_in "title", with: "Horrible Service!"
      fill_in "rating", with: 1
      fill_in "photo", with: "bcd.jpg"
      fill_in "review", with: "it was awful!"
      click_button "Update Review"
    end
    # expect(page).to have_content("Unable to update review: missing required fields")
    expect(current_path).to eq("/shelters/#{@shelter_1.id}")

    expect(page).to have_content("Horrible Service!")
    expect(page).to have_content("1")
    expect(page.find("img")["src"]).to match("bcd.jpg")
    expect(page).to have_content("it was awful!")
  end
end