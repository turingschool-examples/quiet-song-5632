require 'rails_helper'

RSpec.describe "Dish Show Page" do
  before do
    @chef_1 = Chef.create!(name: "Jose")
    @chef_2 = Chef.create!(name: "Kenny")

    @dish_1 = Dish.create!(name: "Chicken", description: "Buttermilk Chicken Breast", chef_id: 1)
    @dish_2 = Dish.create!(name: "Fried Rice", description: "Fried Rice served with veggies", chef_id: 1)

    @ingredient_1 = Ingredient.create!(name: "Chicken Breast", calories: 120)
    @ingredient_2 = Ingredient.create!(name: "Rice", calories: 70)
    @ingredient_3 = Ingredient.create!(name: "Buttermilk", calories: 60)
    @ingredient_4 = Ingredient.create!(name: "Veggies", calories: 20)
  end

  describe "User Story 1" do
    it "has dish attributes" do
      visit dish_path(@dish_1)

      expect(page).to have_content("Chicken")
      expect(page).to have_content("Buttermilk Chicken Breast")

      expect(page).to_not have_content("Fried Rice")
      expect(page).to_not have_content("Fried Rice served with veggies")
    end

    it "has a list of ingredients for dish and total calories" do
      visit dish_path(@dish_1)

      expect(page).to have_content("Chicken Breast")
      expect(page).to have_content("Buttermilk")

      expect(page).to have_content("Total Calories: 180")

      expect(page).to_not have_content("Rice")
      expect(page).to_not have_content("Veggies")

      expect(page).to_not have_content("Total Calories: 90")
    end

    it "shows the chefs name" do
      visit dish_path(@dish_1)

      expect(page).to have_content("Jose")
      expect(page).to_not have_content("Kenny")
    end
  end
end