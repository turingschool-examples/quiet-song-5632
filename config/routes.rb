Rails.application.routes.draw do
    resources :dishes, only: [:show] do
		#code
    end

    resources :chefs, only: [:show] do
		#code
    end
end
