require 'rails_helper'

RSpec.describe "Dish Show Page" do
  before do
    @chef_1 = Chef.create!(name: "Jose")
    @chef_2 = Chef.create!(name: "Kenny")

    @dish_1 = @chef_1.dishes.create!(name: "Chicken", description: "Buttermilk Chicken Breast")
    @dish_2 = @chef_2.dishes.create!(name: "Fried Rice", description: "Fried Rice served with veggies")

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
      save_and_open_page
        within "#dish-#{@dish_1.id}-ingredients" do
        @dish_1.ingredients.each do |ingredient|
          expect(page).to have_content(ingredient.name)
          expect(page).to have_content(ingredient.calories)
        end
      end
    end

    it "shows the chefs name" do
      visit dish_path(@dish_1)

      expect(page).to have_content("Jose")
      expect(page).to_not have_content("Kenny")
    end
  end
end