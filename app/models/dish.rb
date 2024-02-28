class Dish < ApplicationRecord
  belongs_to :chef
  has_many :dish_ingredients
  has_many :ingredients, through: :dish_ingredients

  validates_presence_of :name, :description

  def dish_calorie_content
    ingredients.sum(:calories)
  end
end