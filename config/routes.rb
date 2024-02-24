Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :dishes, only: [:show]
  post "/dishes/:id/ingredients", to: "ingredient_dishes#create", as: :ingredient_dish
  delete "/dishes/:id/ingredients", to: "ingredient_dishes#destroy", as: :destroy_ingredient_dish

  resources :chefs, only: [:show] do
    resources :ingredients, only: [:index]
  end
end
