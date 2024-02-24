class IngredientDishesController < ApplicationController
   def create
   ingredient_dish = IngredientDish.create!(ingredient_id: params[:dish][:ingredient_id], dish_id: params[:id])
   redirect_to dish_path(params[:id])
   end
end