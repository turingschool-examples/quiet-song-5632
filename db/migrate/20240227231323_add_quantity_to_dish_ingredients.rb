class AddQuantityToDishIngredients < ActiveRecord::Migration[7.1]
  def change
    add_column :dish_ingredients, :quantity, :integer, default: 1
  end
end
