Rails.application.routes.draw do
  # shelters
  get "/shelters", to: "shelters#index" 
  get "/shelters/new", to: "shelters#new"
  get "/shelters/:id", to: "shelters#show"
  get "/shelters/:id/edit", to: "shelters#edit"

  post "/shelters", to: "shelters#create"
  patch "/shelters/:id", to: "shelters#update"
  delete "/shelters/:id", to: "shelters#destroy"

  # shelter-reviews
  get "/shelters/:shelter_id/write_review", to: "shelter_reviews#new"
  post "/shelters/:id", to: "shelter_reviews#create"

  # shelter-pets
  get "/shelters/:shelter_id/pets", to: "shelters#index_pets"
  get "/shelters/:shelter_id/pets/new", to: "pets#new"
  post "/shelters/:shelter_id/pets", to: "pets#create"

  # pets
  get "/pets", to: "pets#index"
  get "/pets/:id", to: "pets#show"
  get "/pets/:id/edit", to: "pets#edit"
  patch "/pets/:id", to: "pets#update"
  delete "/pets/:id", to: "pets#destroy"
end
