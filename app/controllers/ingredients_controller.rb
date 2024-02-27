class IngredientsController < ApplicationController
    def create
        ingredient = Ingredient.new(ingredient_params)
    end

    private

    def ingredient_params
        params.permit(:name)
    end
end