Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :dishes, only: [:show]
  post "/dishes/:id", to: "dishes#create"

  resources :chefs, only: [:show]

  get "/chefs/:id/igredients", to: "chefs/ingredients#index"
end
