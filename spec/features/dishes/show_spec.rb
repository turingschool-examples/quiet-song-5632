require 'rails_helper'

RSpec.describe 'Dishes Show Page', type: :feature do
  describe 'As a visitor' do
    before(:each) do
      @chef_1 = Chef.create!({name: "Marco Pierre White"})

      @dish_1 = @chef_1.dishes.create!({name: "Potatoes Gratin", description: "Creamy"})

      @ingredient_1 = Ingredient.create!({name: "Potato", calories: 55})
      @ingredient_2 = Ingredient.create!({name: "Heavy Cream", calories: 145})
      @ingredient_3 = Ingredient.create!({name: "Ricotta Cheese", calories: 200})

      @dish_ingredient_1 = DishIngredient.create!({dish_id: @dish_1.id, ingredient_id: @ingredient_1.id})
      @dish_ingredient_2 = DishIngredient.create!({dish_id: @dish_1.id, ingredient_id: @ingredient_2.id})

      visit dish_path(@dish_1)
    end

    it 'shows the dish name, description, list of ingredients, total calorie count and the chef of the dish' do
      expect(page).to have_content("Name: #{@dish_1.name}")
      expect(page).to have_content("Description: #{@dish_1.description}")
      expect(page).to have_content("Dish Ingredients:")
      expect(page).to have_content(@ingredient_1.name)
      expect(page).to have_content(@ingredient_2.name)
      expect(page).to have_content("Dish Calories: 200")
      expect(page).to have_content("Created by: #{@chef_1.name}")
    end

    it 'has a form to add an existing ingredient to the dish and when submitted with an existing ingredient id, it returns to the show page and shows the new ingredient added to it' do
      expect(page).to have_field("ingredient_id")

      fill_in("ingredient_id", with: "#{@ingredient_3.id}")
      click_on("Submit")

      expect(current_path).to eq(dish_path(@dish_1))
      expect(page).to have_content("Ricotta Cheese")
    end

    it 'has a delete button next to ingredient that when pressed removes the ingredient from the dish' do

      within "#ingredient_#{@ingredient_1.id}" do
        expect(page).to have_button("delete")
      end

      within "#ingredient_#{@ingredient_2.id}" do
        expect(page).to have_button("delete")
        click_on "delete"
      end

      expect(page).to have_content(@ingredient_1.name)
      expect(page).not_to have_content(@ingredient_2.name)
    end
  end
end