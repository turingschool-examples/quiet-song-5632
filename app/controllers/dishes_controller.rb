class DishesController < ApplicationController
  def show 
    @dish = Dish.find(params[:id])
  end

  def create 
    # require 'pry'; binding.pry
    DishIngredient.create!(dish_id: params[:id], ingredient_id: params[:ingredient_id])
    redirect_to dish_path(params[:id])
  end
end