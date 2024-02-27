Rails.application.routes.draw do
	resources :dishes, only: [:show, :update] do
		# Nested route for ingredients for a dish
		resources :ingredients, only: [:index, :create]
		resources :dish_ingredients, only: [:create]
	end

	resources :chefs, only: [:show] do
		# Nested route stuff to show things for a chef
		resources :dishes, only: [:index]
		resources :ingredients, only: [:index], controller: 'chef_ingredients'

		# resources :dishes, only: [] do
		# 	resources :ingredients, only: [:index]
		# end
	end
end