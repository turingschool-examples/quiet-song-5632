class ChefIngredientsController < ApplicationController
    def index
        @chef = Chef.find(params[:chef_id])
        @dishes = @chef.dishes
        @ingredients = @dishes.the_ingredients(params[:chef_id])
    end

end