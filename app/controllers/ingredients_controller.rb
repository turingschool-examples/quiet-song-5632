class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
    if params[:chef_id]
      @chef = Chef.find(params[:chef_id])
    end
  end

end