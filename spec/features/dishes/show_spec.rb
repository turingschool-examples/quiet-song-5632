require 'rails_helper'

RSpec.describe 'Dishes Show Page', type: :feature do
  describe 'As a visitor' do
    before(:each) do
      @chef_1 = Chef.create!({name: "Marco Pierre White"})

      @dish_1 = @chef_1.dishes.create!({name: "Potatoes Gratin", description: "Creamy"})

      @ingredient_1 = Ingredient.create!({name: "Potato", calories: 55})
      @ingredient_2 = Ingredient.create!({name: "Heavy Cream", calories: 145})

      @dish_ingredient_1 = DishIngredient.create!({dish_id: @dish_1.id, ingredient_id: @ingredient_1.id})
      @dish_ingredient_2 = DishIngredient.create!({dish_id: @dish_1.id, ingredient_id: @ingredient_2.id})
    end

    it 'I see the dish name, description, list of ingredients, total calorie count and the chef of the dish' do
      visit dish_path

      expect(page).to have_content("Name: #{@dish_1.name}")
      expect(page).to have_content("Description: #{@dish_1.description}")
      expect(page).to have_content("Dish Ingredients: #{@ingredient_1.name}, #{@ingredient_2.name}")
      expect(page).to have_content("Dish Calories: 200")
      expect(page).to have_content("Created by: #{@chef_1.name}")
    end
  end
end