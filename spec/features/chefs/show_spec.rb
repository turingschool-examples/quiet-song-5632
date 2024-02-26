require 'rails_helper'

RSpec.describe 'Chef Show View', type: :feature do
 describe 'As a visitor' do
  before(:each) do
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

  # User Story 3. As a visitor
  it 'displays a link to view a list of all ingredients that this chef uses in their dishes, takes me to the chefs ingredients index page, where I can see a unique list of names of all the ingredients that this chef uses.' do
    # When I visit a chef's show page
    visit chef_path(@chef_1.id)
    # I see a link to view a list of all ingredients that this chef uses in their dishes.
    expect(page).to have_link("View Chef's Ingredients List", href: chef_ingredients_path(@chef_1.id))
    # When I click on that link
    click_link("View Chef's Ingredients List")
    # I'm taken to a chef's ingredients index page
    expect(current_path).to eq(chef_ingredients_path(@chef_1.id))
    
    #Continued in spec/features/ingredients/index_spec.rb
  end
 end
end