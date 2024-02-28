Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :dishes, only: [:show, :update]
  resources :chefs, only: [:show] do
    get 'table_ingredients', to: 'table_ingredients#index'
  end
end
