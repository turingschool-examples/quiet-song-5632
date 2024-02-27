Rails.application.routes.draw do
	resources :dishes, only: [:show] do
		# Nested route to show ingredients for a dish
		resources :ingredients, only: [:index] 
	end

	resources :chefs, only: [:show] do
		# Nested route to show dishes for a chef
		resources :dishes, only: [:index] 
	end
end