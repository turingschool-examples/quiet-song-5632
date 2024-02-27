class ChefsController < ApplicationController
    def show
        @chef = Chef.find(params[:id])
        @ingredients = @chef.dishes.flat_map(&:ingredients).uniq    end
end