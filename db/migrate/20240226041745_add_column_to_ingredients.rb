class AddColumnToIngredients < ActiveRecord::Migration[7.1]
  def change
    add_column :ingredients, :name, :string
  end
end
