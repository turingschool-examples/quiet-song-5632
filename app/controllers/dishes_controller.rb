class DishesController < ApplicationController
  def show
    @dish = Dish.find(params[:id])
  end

  def update
    dish = Dish.find(params[:id])
    dish.dish_ingredients.create!(ingredient_id: params[:ingredient_id])

    redirect_to dish_path(dish.id)
  end
end