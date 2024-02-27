class DishesController < ApplicationController
  def show
    @dish = Dish.find(params[:id])
    #@chef = Chef.find(params[:id])
    
  end
end