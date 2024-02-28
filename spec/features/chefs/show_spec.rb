require "rails_helper"

RSpec.describe "chefs show" do
  before(:each) do
    @chef = Chef.create(name: 'Bob')
    @dish = @chef.dishes.create(name: 'Lasagna',description: 'Delicious food')
    
    @ingredient1 = Ingredient.create(name: 'Pasta', calories: 200)
    @ingredient2 = Ingredient.create(name: 'Cheese', calories: 300)
    @ingredient3 = Ingredient.create(name: 'Shrimp', calories: 400)

    DishIngredient.create(dish:@dish, ingredient: @ingredient1)
    DishIngredient.create(dish:@dish, ingredient: @ingredient2)
    DishIngredient.create(dish:@dish, ingredient: @ingredient2)
    DishIngredient.create(dish:@dish, ingredient: @ingredient3)
  end

  describe 'US 3' do
    it 'has a link to all the chefs ingredients' do
      visit chef_path(@chef)
      # When I visit a chef's show page
      
      expect(page).to have_link('All Ingredients')
      # I see a link to view a list of all ingredients that this chef uses in their dishes.
      
      click_link('All Ingredients')
      # When I click on that link
      
      expect(current_path).to eq(chef_ingredients_path(@chef.id))
      # I'm taken to a chef's ingredients index page
      
      
      expect(page).to have_content('Ingredients Used by Chef Bob:')
      expect(page).to have_content('Pasta')
      expect(page).to have_content('Cheese')
      expect(page).to have_content('Shrimp')
      # and I can see a unique list of names of all the ingredients that this chef uses.
      save_and_open_page
    end
  end
end