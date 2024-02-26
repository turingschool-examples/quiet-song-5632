Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :dishes, only: [:show, :update]
  resources :chefs, only: :show 
  namespace :chef do
    resources :ingredients, only: :index
  end
end
