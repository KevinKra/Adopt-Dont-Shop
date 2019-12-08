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

@review_1 = ShelterReview.create(
  title: "Great Service",
  rating: 5,
  photo: "abc.jpg",
  review: "They did swell! Loved it!",
  shelter: @shelter_1
)