class Dish < ApplicationRecord
  validates_presence_of :name, :description

  belongs_to :chef
  has_many :dish_ingredients
  has_many :ingredients, through: :dish_ingredients

  def total_dish_calories
      Dish.find_by_sql("SELECT sum(dish_ingredients.quantity * ingredients.calories)
      FROM dishes
      JOIN dish_ingredients ON dishes.id = dish_ingredients.dish_id
      JOIN ingredients ON ingredients.id = dish_ingredients.ingredient_id
      WHERE dishes.id = #{self.id}").first.sum

    # Dish.joins(dish_ingredients: :ingredient)
    #   .select("sum(dish_ingredients.quantity * ingredients.calories)")
    #   .where("dishes.id = #{self.id}")
    #   .group(:id)
    
    #   .sum("dish_ingredients.quantity * ingredients.calories")
  end
end