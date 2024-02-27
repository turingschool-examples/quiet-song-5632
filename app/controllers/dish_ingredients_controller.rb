class DishIngredientsController < ApplicationController

    def create
        @dish = Dish.find(params[:id])
        @ingredient = Ingredient.find(params[:ingredient_id])
        DishIngredient.create!(dish_id: @dish.id, ingredient_id: @ingredient.id)
        redirect_to dish_path(id: @dish.id)
    end
end