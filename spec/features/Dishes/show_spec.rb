require "rails_helper"

RSpec.describe "Dish Show Page" do
  
  before(:each) do
   @chef = Chef.create(name: "Alex")
   @dish = @chef.dishes.create!(name: "test", description: "im a good dish")
   @dish_1 = @chef.dishes.create!(name: "test1", description: "im a better dish")

   @ingredient = Ingredient.create!(name: "salt", calories: 12)
   @ingredient_1 = Ingredient.create!(name: "pepper", calories: 20)
   @dish_ingredient = DishIngredient.create!(dish_id: @dish.id, ingredient_id: @ingredient.id)
   @dish_ingredient_1 = DishIngredient.create!(dish_id: @dish.id, ingredient_id: @ingredient_1.id)
  end
  
  it "shows a dish details" do
    visit dish_path(id: @dish.id)


    expect(page).to have_content(@dish.name)
    expect(page).to have_content(@dish.description)
    expect(page).to have_content(@ingredient.name)
    expect(page).to have_content(@ingredient_1.name)
    expect(page).to have_content(32)
    expect(page).to have_content(@chef.name)
  end

  it "adds an ingredient to dish" do

    visit dish_path(id: @dish_1.id)

    expect(page).to have_content("add an ingredient")

    fill_in :ingredient_id, with: @ingredient.id
    click_on "Submit"

  expect(current_path).to eq(dish_path(id: @dish_1.id))

  expect(page).to have_content(@ingredient.name)


  end
end