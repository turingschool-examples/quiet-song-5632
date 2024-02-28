require 'rails_helper'

RSpec.describe 'Chefs Show Page', type: :feature do
  describe 'As a visitor' do
    before(:each) do
      @chef_1 = Chef.create!({name: "Marco Pierre White"})

      @dish_1 = @chef_1.dishes.create!({name: "Potatoes Gratin", description: "Creamy"})
      @dish_2 = @chef_1.dishes.create!({name: "Potatoes", description: "Dry"})

      @ingredient_1 = Ingredient.create!({name: "Potato", calories: 55})
      @ingredient_2 = Ingredient.create!({name: "Heavy Cream", calories: 145})
      @ingredient_3 = Ingredient.create!({name: "Ricotta Cheese", calories: 200})

      @dish_ingredient_1 = DishIngredient.create!({dish_id: @dish_1.id, ingredient_id: @ingredient_1.id})
      @dish_ingredient_2 = DishIngredient.create!({dish_id: @dish_1.id, ingredient_id: @ingredient_2.id})
      @dish_ingredient_3 = DishIngredient.create!({dish_id: @dish_1.id, ingredient_id: @ingredient_3.id})
      @dish_ingredient_4 = DishIngredient.create!({dish_id: @dish_1.id, ingredient_id: @ingredient_1.id})

      visit chef_path(@chef_1)  
    end

    it 'has a link to see all ingredients the chef uses in their dishes and when the link is clicked, taken to an ingredients index page to see a unique list of ingredients the chef uses' do
      expect(page).to have_link("Chef's Ingredients")

      click_link("Chef's Ingredients")

      expect(current_path).to eq(chef_ingredients_path(@chef_1))
      expect(page).to have_content(@ingredient_1.name, count: 1)
      expect(page).to have_content(@ingredient_2.name)
      expect(page).to have_content(@ingredient_3.name)
    end
  end
end