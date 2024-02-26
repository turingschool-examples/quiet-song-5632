class CreateIngredients < ActiveRecord::Migration[7.1]
  def change
    create_table :ingredients do |t|
      t.integer :calorie_count

      t.timestamps
    end
  end
end
