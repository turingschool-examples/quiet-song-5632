class Dish < ApplicationRecord
  validates_presence_of :name, :description
  belongs_to :chef
  has_many :ingredient_dishes
  has_many :ingredients, through: :ingredient_dishes

  def total_calories
    ingredients.sum(:calories)
  end
end