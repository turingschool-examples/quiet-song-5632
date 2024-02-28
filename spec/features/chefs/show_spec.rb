require 'rails_helper'

RSpec.describe "Chefs#show", type: :feature do
  before(:each) do
    @chef_1 = Chef.create(name: "Luis")

    @dish_1 = @chef_1.dishes.create!(name: "Bandeja Paisa", description: "good food")

    @ingredient_1 = TableIngredient.create!(name: "Chorizo", calories: 20)
    @ingredient_2 = TableIngredient.create!(name: "Eggs", calories: 20)

    @dish_ingredient_1 = DishIngredient.create!(dish_id: @dish_1.id, table_ingredient_id: @ingredient_1.id)
    @dish_ingredient_2 = DishIngredient.create!(dish_id: @dish_1.id, table_ingredient_id: @ingredient_2.id)
    visit chef_path(@chef_1)
  end

  it "" do
    # When I visit a chef's show page
    # I see a link to view a list of all ingredients that this chef uses in their dishes.
    expect(page).to have_link('Table Ingredients', href: chef_table_ingredients_path(@chef_1))
    # When I click on that link
    # I'm taken to a chef's ingredients index page
    # and I can see a unique list of names of all the ingredients that this chef uses.
    expect(current_path).to eq(chef_table_ingredients_path(@chef_1))
    expect(page).to have_content(@ingredient_1.name)
    expect(page).to have_content(@ingredient_2.name)
  end
end