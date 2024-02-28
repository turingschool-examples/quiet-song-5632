class CreateTableIngredients < ActiveRecord::Migration[7.1]
  def change
    create_table :table_ingredients do |t|
      t.string :name
      t.integer :calories

      t.timestamps
    end
  end
end
