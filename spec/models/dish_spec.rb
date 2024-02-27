require 'rails_helper'

RSpec.describe Dish, type: :model do

  describe "validations" do
      it {should validate_presence_of :name}
      it {should validate_presence_of :description}
  end

  describe "relationships" do
      it {should belong_to :chef}
      it {should have_many :dish_ingredients}
      it {should have_many(:ingredients).through(:dish_ingredients)}
  end

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

  describe "instance methods" do
    it "#total_dish_calories" do
      expect(dish_1.total_dish_calories).to eq(130)
      expect(dish_2.total_dish_calories).to eq(220)
    end
  end
end