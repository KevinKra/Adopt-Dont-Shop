Rails.application.routes.draw do
  # shelters
  get "/shelters", to: "shelters#index" 
  get "/shelters/new", to: "shelters#new"
  get "/shelters/:id", to: "shelters#show"
  get "/shelters/:id/edit", to: "shelters#edit"
  post "/shelters", to: "shelters#create"
  patch "/shelters/:id", to: "shelters#update"
  delete "/shelters/:id", to: "shelters#destroy"

  # pets
  get "/pets", to: "pets#index"
end
