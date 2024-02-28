class CreateDishIngredients < ActiveRecord::Migration[7.1]
  def change
    create_table :dish_ingredients do |t|
      t.references :dish, null: false, foreign_key: true
      t.references :table_ingredient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
