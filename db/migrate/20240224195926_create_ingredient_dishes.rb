class CreateIngredientDishes < ActiveRecord::Migration[7.1]
  def change
    create_table :ingredient_dishes do |t|
      t.references :dish, null: false, foreign_key: true
      t.references :ingredient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
