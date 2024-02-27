class Dish < ApplicationRecord
  validates_presence_of :name, :description
  belongs_to :chef
  has_many :dish_ingredients, dependent: :destroy 
  has_many :ingredients, through: :dish_ingredients

  def dish_calories
    Dish
    .joins(:ingredients)
    .where("dishes.id = #{self.id}")
    .pick("sum(ingredients.calories)")    
  end

  def ingredient_names
    Dish
    .joins(:ingredients)
    .where("dishes.id = #{self.id}")
    .pluck("ingredients.name")
  end
end