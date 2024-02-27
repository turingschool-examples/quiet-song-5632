class DishesController < ApplicationController
    def show
        @dish = Dish.find(params[:id])
    end

    def update
        @dish = Dish.find(params[:id])
        @ingredient = Ingredient.find(params[:dish][:ingredient_id])
    
        @dish.add_ingredient(@ingredient.id)
        redirect_to "/dishes/#{@dish.id}"
    end
    
end