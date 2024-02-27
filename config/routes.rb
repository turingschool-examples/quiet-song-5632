Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :dishes, only: [:show]
  
  resources :chefs, only: [:show] do
    get 'ingredients', to: 'ingredients#index'
  end


  post "/dishes/:id/ingredients", to: "dish_ingredients#create"
end
