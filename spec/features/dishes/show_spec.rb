require 'rails_helper'

RSpec.describe 'Show Page', type: :feature do
  describe 'As a visitor' do
    before(:each) do
      @chef_1 = Chef.create!(name: "Bobby")

      @dish_1 = @chef_1.dishes.create!(name: "Slime", description: "Green Ooze")

      @ingred_1 = Ingredient.create!(name: "Unknown", calories: 100)
      @ingred_2 = Ingredient.create!(name: "Beans", calories: 60)
      @ingred_3 = Ingredient.create!(name: "Mysterious Liquid", calories: 1000)

      DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingred_1.id)
      DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingred_3.id)
    end
    
    # Us-1
    it "displays the name of dish and it's description with the list of ingredients" do
      # When I visit a dish's show page
      visit dish_path(@dish_1)
      # I see the dish’s name and description
      expect(page).to have_content(@dish_1.name)
      expect(page).to have_content(@dish_1.description)
      # And I see a list of ingredients for that dish
      within "#ingredient-#{@ingred_1.id}" do
        expect(page).to have_content(@ingred_1.name)
      end
    
      within "#ingredient-#{@ingred_3.id}" do
        expect(page).to have_content(@ingred_3.name)
      end
  
      # And I see the chef's name.
      expect(page).to have_content(@chef_1.name)
      # and a total calorie count for that dish
      expect(page).to have_content("Total calories: 1100")
    end

    # us-2
    it "has a form to add an existing ingredient to the dish" do 
      # When I visit a dish's show page
      visit dish_path(@dish_1)
      # I see a form to add an existing Ingredient to that Dish
      expect(page).to_not have_content(@ingred_2.name)
      expect(page).to have_field(:ingredient_id)
      # When I fill in the form with the ID of an Ingredient that exists in the database
      fill_in(:ingredient_id, with: @ingred_2.id)
      # And I click Submit
      click_on("Submit")
      # Then I am redirected to that dish's show page
      visit dish_path(@dish_1)
      # And I see that ingredient is now listed. 
      expect(page).to have_content(@ingred_2.name)
    end 
  end 
end