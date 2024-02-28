class DishIngredientsController < ApplicationController
  def create 
    # require 'pry'; binding.pry
    dish_ingredient = DishIngredient.create(dish_id: params[:dish_id], ingredient_id: params[:ingredient_id])

    redirect_to dish_path(params[:dish_id])
  end
end