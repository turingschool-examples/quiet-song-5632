require 'rails_helper'

RSpec.describe 'Show Page', type: :feature do
  describe 'As a visitor' do
    before(:each) do
      @chef_1 = Chef.create!(name: "Bobby")

      @dish_1 = @chef_1.dishes.create!(name: "Slime", description: "Green Ooze")
      @dish_2 = @chef_1.dishes.create!(name: "Money Maker", description: "For the Rich")

      @ingred_1 = Ingredient.create!(name: "Unknown", calories: 100)
      @ingred_2 = Ingredient.create!(name: "Beans", calories: 60)
      @ingred_3 = Ingredient.create!(name: "Mysterious Liquid", calories: 1000)
      @ingred_4 = Ingredient.create!(name: "Tea Leaf", calories: 1000)
      @ingred_5 = Ingredient.create!(name: "Diamonds", calories: 0)

      DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingred_1.id)
      DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingred_3.id)
      DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @ingred_4.id)
      DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @ingred_5.id)
    end

    #us-3
    it 'Has a link to all the dishes for that chef' do
    # When I visit a chef's show page
      visit chef_path(@chef_1)
      # I see a link to view a list of all ingredients that this chef uses in their dishes.
      expect(page).to have_link("Chef's Special Ingredients")
      # When I click on that link
      click_link("Chef's Special Ingredients")
      # I'm taken to a chef's ingredients index page
      visit "/chefs/#{@chef_1.id}/igredients"
      # and I can see a unique list of names of all the ingredients that this chef uses.
      save_and_open_page
      expect(page).to have_content(@ingred_4.name)
      expect(page).to have_content(@ingred_5.name)
      expect(page).to have_content(@ingred_1.name)
      expect(page).to have_content(@ingred_3.name)
      expect(page).to_not have_content(@ingred_2.name)
    end
  end
end