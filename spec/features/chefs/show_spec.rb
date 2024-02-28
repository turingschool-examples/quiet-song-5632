require "rails_helper"

RSpec.describe "Chef Show Page", type: :feature do
  describe "As a visitor" do
    let!(:chef_1) {Chef.create!(name: "John")}
    let!(:chef_2) {Chef.create!(name: "Jane")}

    let!(:dish_1) {chef_1.dishes.create!(name: "Salad", description: "rabbit food")}
    let!(:dish_2) {chef_1.dishes.create!(name: "Tuna Sandwich", description: "something fishy")}
    let!(:dish_3) {chef_2.dishes.create!(name: "Fries", description: "delicious")}

    let!(:ingredient_1) {Ingredient.create!(name: "lettuce", calories: 20)}
    let!(:ingredient_2) {Ingredient.create!(name: "tomato", calories: 30)}
    let!(:ingredient_3) {Ingredient.create!(name: "cheese", calories: 50)}
    let!(:ingredient_4) {Ingredient.create!(name: "bread", calories: 100)}
    let!(:ingredient_5) {Ingredient.create!(name: "potato", calories: 100)}

    let!(:dish_ingredients_1) {DishIngredient.create!(dish: dish_1, ingredient: ingredient_1)}
    let!(:dish_ingredients_2) {DishIngredient.create!(dish: dish_1, ingredient: ingredient_2, quantity: 2)}
    let!(:dish_ingredients_3) {DishIngredient.create!(dish: dish_1, ingredient: ingredient_3)}
    let!(:dish_ingredients_4) {DishIngredient.create!(dish: dish_2, ingredient: ingredient_1)}
    let!(:dish_ingredients_5) {DishIngredient.create!(dish: dish_2, ingredient: ingredient_4, quantity: 2)}
    let!(:dish_ingredients_6) {DishIngredient.create!(dish: dish_3, ingredient: ingredient_5)}

    before do
      visit chef_path(chef_1)
    end

    it "displays link to view all chef's ingredients" do
      expect(page).to have_link("Ingredient List")
      click_on "Ingredient List"
      
      expect(current_path).to eq(chef_ingredients_path(@chef))

      expect(page).to have_content("lettuce")
      expect(page).to have_content("tomato")
      expect(page).to have_content("cheese")
      expect(page).to have_content("bread")
      expect(page).to_not have_content("potato")
    end
  end
end