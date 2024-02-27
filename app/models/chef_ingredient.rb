class ChefIngredient < ApplicationRecord
    
    def the_ingredients(chef_id)
        chef = Chef.find(chef_id)
        ingredients = chef.ingredients
    end
end