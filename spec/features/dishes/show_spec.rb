require "rails_helper"

RSpec.describe "Dish show" do
  before(:each) do

    @chef = Chef.create(name: 'Bob')
    @dish = @chef.dishes.create(name: 'Lasagna',description: 'Delicious food')
    
    @ingredient1 = Ingredient.create(name: 'Pasta', calories: 200)
    @ingredient2 = Ingredient.create(name: 'Cheese', calories: 300)
    @ingredient3 = Ingredient.create(name: 'Shrimp', calories: 400)

    DishIngredient.create(dish:@dish, ingredient: @ingredient1)
    DishIngredient.create(dish:@dish, ingredient: @ingredient2)
  end

  describe 'US 1' do
    it 'displays a dish name and description ' do
      visit dish_path(@dish)
      # When I visit a dish's show page
      
      expect(page).to have_content('Dish Name: Lasagna')
      expect(page).to have_content('Description: Delicious food')
      # I see the dish’s name and description
      expect(page).to have_content('Ingredients:')
      expect(page).to have_content('Pasta')
      expect(page).to have_content('Cheese')
      # And I see a list of ingredients for that dish

      expect(page).to have_content('Calorie Count: 500')
      # and a total calorie count for that dish

      expect(page).to have_content('Chef Name: Bob')
      # And I see the chef's name.
    end
  end


  describe 'US 2' do
    it 'has a form to add an existing Ingredient to that Dish' do
      visit dish_path(@dish)
      # When I visit a dish's show page
      expect(page).to have_content('Add Ingredient')

      expect(page).to_not have_content('Shrimp')

      expect(page).to have_field(:ingredient_id)
      # I see a form to add an existing Ingredient to that Dish

      fill_in(:ingredient_id, with: @ingredient3.id)
      # When I fill in the form with the ID of an Ingredient that exists in the database

      click_on("Submit")
      # And I click Submit

      expect(current_path).to eq(dish_path(@dish))
      # Then I am redirected to that dish's show page

      expect(page).to have_content('Shrimp')
      # And I see that ingredient is now listed. 

    end
  end
end