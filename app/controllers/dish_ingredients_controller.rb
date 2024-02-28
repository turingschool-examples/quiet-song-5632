class DishIngredientsController < ApplicationController

  def create
    DishIngredient.create!(strong_params)
    redirect_to dish_path(strong_params[:dish_id])
  end

  def destroy
    DishIngredient.destroy(strong_params[:id])
    redirect_to dish_path(strong_params[:dish_id])
  end

private
  def strong_params
    params.permit(:ingredient_id, :dish_id, :id)
  end

end