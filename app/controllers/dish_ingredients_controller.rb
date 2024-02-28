class DishIngredientsController < ApplicationController
  def update
    dish = Dish.find(params[:dish_id])
    ingredient = Ingredient.find(params[:ingredient_id])
    DishIngredient.create(dish_id: dish.id, ingredient_id: ingredient.id)
    redirect_to dish_path(dish)
  end
end