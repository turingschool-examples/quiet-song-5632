require "rails_helper"

RSpec.describe "Chef Show Page" do
  
  before(:each) do
   @chef = Chef.create(name: "Alex")
   @dish = @chef.dishes.create!(name: "test", description: "im a good dish")
   @dish_1 = @chef.dishes.create!(name: "test1", description: "im a better dish")

   @ingredient = Ingredient.create!(name: "salt", calories: 12)
   @ingredient_1 = Ingredient.create!(name: "pepper", calories: 20)
   @dish_ingredient = DishIngredient.create!(dish_id: @dish.id, ingredient_id: @ingredient.id)
   @dish_ingredient_1 = DishIngredient.create!(dish_id: @dish.id, ingredient_id: @ingredient_1.id)
  end

  it "shows a chef details with ingredients" do
    visit chef_path(id: @chef.id)

    expect(page).to have_content(@chef.name)
    click_on "View Ingredients"

    expect(page).to have_content(@ingredient.name)
    expect(page).to have_content(@ingredient_1.name)

    expect(current_path).to eq(chef_ingredients_path(@chef))
    end
    
  end













