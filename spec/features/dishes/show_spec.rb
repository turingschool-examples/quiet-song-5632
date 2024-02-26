require 'rails_helper'

RSpec.describe 'Dish Show Page', type: :feature do
 describe 'As a visitor' do
  before(:each) do
    @chef_1 = Chef.create!(name: "Isaac")
    
    @dish_1 = @chef_1.dishes.create!(name: "Burger", description: "Big mac copy")

    @ingredient_bun = Ingredient.create!(name: "Bread", calorie_count: 10)
    @ingredient_lettuce = Ingredient.create!(name: "Lettuce", calorie_count: 1)
    @ingredient_meat = Ingredient.create!(name: "Meat", calorie_count: 15)
    @ingredient_tomatoe = Ingredient.create!(name: "Tomatoe", calorie_count: 1)
    
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
 end
end