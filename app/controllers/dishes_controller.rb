class DishesController < ApplicationController
  def show
    @dish = Dish.find(params[:id])
  end
  
  def update
    dish = Dish.find(params[:id])
    dish.dish_ingredients.create(table_ingredient_id: params[:table_ingredient_id])
    redirect_to dish_path(dish)
  end
end