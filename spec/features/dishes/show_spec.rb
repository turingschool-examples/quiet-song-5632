require 'rails_helper'

RSpec.describe 'Show Page', type: :feature do
  describe 'As a visitor' do
    before(:each) do
      @chef_1 = Chef.create!(name: "Bobby")

      @dish_1 = @chef_1.dishes.create!(name: "Slime", description: "Green Ooze")

      @ingred_1 = Ingredient.create!(name: "Unknown", calories: 100)

      DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingred_1.id)
    end

    # Us-1
    it "displays the name of dish and it's description with the list of ingredients" do
      # When I visit a dish's show page
      visit dish_path(@dish_1)
      # I see the dish’s name and description
      expect(page).to have_content(@dish_1.name)
      expect(page).to have_content(@dish_1.description)
      # And I see a list of ingredients for that dish
      # and a total calorie count for that dish
      # And I see the chef's name.
      expect(page).to have_content(@ingred_1.name)
      expect(page).to have_content(@ingred_1.calories)
      expect(page).to have_content(@chef_1.name)
    end
  end
end