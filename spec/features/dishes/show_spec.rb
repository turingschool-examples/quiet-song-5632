require 'rails_helper'

RSpec.describe 'Dish Show Page', type: :feature do
  describe 'As a visitor' do
    before do
      @chef_1 = Chef.create!(name: "Isaac")
      
      @dish_1 = @chef_1.dishes.create!(name: "Burger", description: "Big mac copy")

      @ingredient_bun = Ingredient.create!(name: "Bread", calorie_count: 10)
      @ingredient_lettuce = Ingredient.create!(name: "Lettuce", calorie_count: 1)
      @ingredient_meat = Ingredient.create!(name: "Meat", calorie_count: 15)
      @ingredient_tomatoe = Ingredient.create!(name: "Tomatoe", calorie_count: 1)
      @ingredient_bm_sauce = Ingredient.create!(name: "Big Mac Sauce", calorie_count: 33)
      
      @dish_ingredient = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_bun.id)
      @dish_ingredient = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_meat.id)
      @dish_ingredient = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_lettuce.id)
      @dish_ingredient = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_tomatoe.id)
    end

    # User Story 1. As a visitor
    it 'displays the dish name, description, list of ingredients, calorie count and chef' do
      # When I visit a dish's show page
      visit dish_path(@dish_1.id)
      # I see the dish’s name and description
      expect(page).to have_content("Dish: #{@dish_1.name}")
      expect(page).to have_content("Description: #{@dish_1.description}")
      # And I see a list of ingredients for that dish
      within "#ingredients" do
        expect(page).to have_content("Ingredients")
        expect(page).to have_content("#{@ingredient_bun.name}")
        expect(page).to have_content("#{@ingredient_meat.name}")
        expect(page).to have_content("#{@ingredient_lettuce.name}")
        expect(page).to have_content("#{@ingredient_tomatoe.name}")
      end
      # and a total calorie count for that dish
      expect(page).to have_content("Total calorie count: 27")
      # And I see the chef's name.
      expect(page).to have_content("Chef: Isaac")
    end

    # User Story 2. As a visitor
    it "displays form to add ingredient to dish and succesfully adds existing ingredient" do
      # When I visit a dish's show page
      visit dish_path(@dish_1.id)
      within "#add_ingredients" do
        # I see a form to add an existing Ingredient to that Dish
        expect(page).to have_content("Add Ingredient to Dish:")
        # When I fill in the form with the ID of an Ingredient that exists in the database
        fill_in :ingredient_id, with: "#{@ingredient_bm_sauce.id}"
        # And I click Submit
        click_button("Submit")
      end

      # Then I am redirected to that dish's show page
      expect(current_path).to eq(dish_path(@dish_1.id))
      # And I see that ingredient is now listed.
      within "#ingredients" do
        expect(page).to have_content("#{@ingredient_bm_sauce.name}")
      end
      expect(page).to have_content("Total calorie count: 60")
    end
  end
end