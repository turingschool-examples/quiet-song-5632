class Ingredient < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :calorie_count
  
  has_many :dish_ingredients, dependent: :destroy
  has_many :dishes, through: :dish_ingredients
end
