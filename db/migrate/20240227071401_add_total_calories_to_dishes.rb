class AddTotalCaloriesToDishes < ActiveRecord::Migration[7.1]
  def change
    add_column :dishes, :total_calories, :integer
  end
end
