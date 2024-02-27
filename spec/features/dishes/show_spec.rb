require "rails_helper"

RSpec.describe "Dish Show Page", type: :feature do
  describe "As a visitor" do
    let!(:chef_1) {Chef.create!(name: "John")}

    let!(:dish_1) {chef_1.dishes.create!(name: "Salad", description: "rabbit food")}
    let!(:dish_2) {chef_1.dishes.create!(name: "Tuna Sandwich", description: "something fishy")}

    let!(:ingredient_1) {Ingredient.create!(name: "lettuce", calories: 20)}
    let!(:ingredient_2) {Ingredient.create!(name: "tomato", calories: 30)}
    let!(:ingredient_3) {Ingredient.create!(name: "cheese", calories: 50)}
    let!(:ingredient_4) {Ingredient.create!(name: "bread", calories: 100)}

    let!(:dish_ingredients_1) {DishIngredient.create!(dish: dish_1, ingredient: ingredient_1)}
    let!(:dish_ingredients_2) {DishIngredient.create!(dish: dish_1, ingredient: ingredient_2, quantity: 2)}
    let!(:dish_ingredients_3) {DishIngredient.create!(dish: dish_1, ingredient: ingredient_3)}
    let!(:dish_ingredients_4) {DishIngredient.create!(dish: dish_2, ingredient: ingredient_1)}
    let!(:dish_ingredients_5) {DishIngredient.create!(dish: dish_2, ingredient: ingredient_4, quantity: 2)}

    before do
      visit dish_path(dish_1)
    end

    it "displays dish's attributes" do
      expect(page).to have_content("Salad")
      expect(page).to have_content("rabbit food")
      expect(page).to_not have_content("Tuna Sandwich")
      expect(page).to_not have_content("something fishy")
    end

    it "displays dish's ingredients list" do
      expect(page).to have_content("lettuce")
      expect(page).to have_content("tomato")
      expect(page).to have_content("cheese")
      expect(page).to_not have_content("bread")
    end

    it "displays dish's total calories" do
      expect(page).to have_content("Total Calories: 130")

      visit dish_path(dish_2)
      expect(page).to have_content("Total Calories: 220")
    end
  end
end