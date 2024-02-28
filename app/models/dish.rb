class Dish < ApplicationRecord
  validates_presence_of :name, :description
  belongs_to :chef

  has_many :dish_ingredients, dependent: :destroy
  has_many :table_ingredients, through: :dish_ingredients

  def total_calories_count
    table_ingredients.sum(:calories)
  end
end