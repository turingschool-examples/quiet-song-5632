class DishIngredient < ApplicationRecord
  belongs_to :dish
  belongs_to :table_ingredient
end