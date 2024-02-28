require 'rails_helper'

RSpec.describe "Dish#show", type: :feature do
  before(:each) do
    @chef_1 = Chef.create(name: "Luis")

    @dish_1 = @chef_1.dishes.create!(name: "Bandeja Paisa", description: "good food")

    @ingredient_1 = TableIngredient.create!(name: "Chorizo", calories: 20)
    @ingredient_2 = TableIngredient.create!(name: "Eggs", calories: 20)

    @dish_ingredient_1 = DishIngredient.create!(dish_id: @dish_1.id, table_ingredient_id: @ingredient_1.id)
    @dish_ingredient_2 = DishIngredient.create!(dish_id: @dish_1.id, table_ingredient_id: @ingredient_2.id)
  end

  it "displays the dish details" do
    # When I visit a dish's show page
    visit dish_path(@dish_1)
    # I see the dish’s name and description
    expect(page).to have_content(@dish_1.name)
    expect(page).to have_content(@dish_1.description)
    # And I see a list of ingredients for that dish
    # and a total calorie count for that dish
    expect(page).to have_content(@ingredient_1.name)
    expect(page).to have_content(@ingredient_2.name)
    expect(page).to have_content(40)
    # And I see the chef's name.
    expect(page).to have_content(@chef_1.name)
  end

  it "can add an ingredient" do
    # When I visit a dish's show page
    visit dish_path(@dish_1)
    # I see a form to add an existing Ingredient to that Dish
    expect(page).to have_content("Add Ingredient")
    # When I fill in the form with the ID of an Ingredient that exists in the database
    # And I click Submit
    fill_in :table_ingredient_id, with: @ingredient_1.id
    click_on "Submit"
    # Then I am redirected to that dish's show page
    expect(current_path).to eq(dish_path(@dish_1))
    # And I see that ingredient is now listed. 
    expect(page).to have_content(@ingredient_1.name)
  end
end