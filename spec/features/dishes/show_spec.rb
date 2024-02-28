require 'rails_helper'

RSpec.describe "Dish's Show Page", type: :feature do
    before(:each) do
      @chef_1 = Chef.create!({name: "Anthony Bourdain"})

      @dish_1 = @chef_1.dishes.create!({name: "Poulet Basquaise", description: "Quick-braised chicken with cayenne"})

      @ingredient_1 = Ingredient.create!({name: "Chicken", calories: 500})
      @ingredient_2 = Ingredient.create!({name: "Olive Oil", calories: 15})
      @ingredient_3 = Ingredient.create!({name: "Cayenne", calories: 115})

      @dish_ingredient_1 = DishIngredient.create!({dish_id: @dish_1.id, ingredient_id: @ingredient_1.id})
      @dish_ingredient_2 = DishIngredient.create!({dish_id: @dish_1.id, ingredient_id: @ingredient_2.id})
      @dish_ingredient_3 = DishIngredient.create!({dish_id: @dish_1.id, ingredient_id: @ingredient_3.id})
    end
    
  describe "User Story 1 - Dish's Show Page" do
    it "displays dish's name, description, list of ingredients, total calorie count, and chef's name" do

      visit dish_path(@dish_1.id)

      expect(page).to have_content("Name: Poulet Basquaise")
      expect(page).to have_content("Description: Quick-braised chicken with cayenne")
      expect(page).to have_content("Dish Ingredients: Chicken, Olive Oil, Cayenne")
      expect(page).to have_content("Calorie Content: 630")
      expect(page).to have_content("Chef's Name: Anthony Bourdain")
    end
  end
end