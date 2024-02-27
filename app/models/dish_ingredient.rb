class DishIngredient < ApplicationRecord
  belongs_to :dish
  belongs_to :ingredient

  validates :quantity, presence: true, numericality: true
end