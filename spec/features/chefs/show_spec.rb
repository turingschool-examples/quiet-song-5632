require 'rails_helper'

RSpec.describe "Chef's Show Page", type: :feature do
    before(:each) do
      @chef_1 = Chef.create!({name: "Anthony Bourdain"})

      @dish_1 = @chef_1.dishes.create!({name: "Poulet Basquaise", description: "Quick-braised chicken with cayenne"})

      @ingredient_1 = Ingredient.create!({name: "Chicken", calories: 500})
      @ingredient_2 = Ingredient.create!({name: "Olive Oil", calories: 15})
      @ingredient_3 = Ingredient.create!({name: "Cayenne", calories: 115})
      @ingredient_4 = Ingredient.create!({name: "Rosemary", calories: 50})

      @dish_ingredient_1 = DishIngredient.create!({dish_id: @dish_1.id, ingredient_id: @ingredient_1.id})
      @dish_ingredient_2 = DishIngredient.create!({dish_id: @dish_1.id, ingredient_id: @ingredient_2.id})
      @dish_ingredient_3 = DishIngredient.create!({dish_id: @dish_1.id, ingredient_id: @ingredient_3.id})
      @dish_ingredient_4 = DishIngredient.create!({dish_id: @dish_1.id, ingredient_id: @ingredient_4.id})
    end
    
  describe "User Story 3 - Chef's Show Page" do
    it "displays a link to view a list of all ingredients that this chef uses in their dishes" do

      visit chef_path(@chef_1.id)

      expect(page).to have_link("Chef's Ingredients List")

      click_link("Chef's Ingredients List")

      expect(current_path).to eq(chef_ingredients_path(@chef_1.id))
      expect(page).to have_content("Chicken")
      expect(page).to have_content("Olive Oil")
      expect(page).to have_content("Cayenne")
      expect(page).to have_content("Rosemary")
    end
  end
end