class Ingredient < ApplicationRecord

  has_many :dish_ingredients, dependent: :destroy
  has_many :dishes, through: :dish_ingredients

  def find_dish_ingredient(dish_id)
    DishIngredient
    .select("dish_ingredients.*")
    .where("dish_ingredients.dish_id = #{dish_id} AND dish_ingredients.ingredient_id = #{self.id}")
    .first
  end

end