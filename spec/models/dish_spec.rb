require 'rails_helper'

RSpec.describe Dish, type: :model do

  describe "validations" do
      it {should validate_presence_of :name}
      it {should validate_presence_of :description}
  end

  describe "relationships" do
      it {should belong_to :chef}
      it {should have_many :ingredient_dishes}
      it {should have_many(:ingredients).through(:ingredient_dishes)}
  end

  describe "#total_calories" do
    it "sums the amount of calories of a dish" do
      chef_1 = Chef.create!(name: "Jack S.")
      dish_1 = chef_1.dishes.create!(name: "Jollof Rice", description: "Nigerian Cousine")

      jasmine_rice = Ingredient.create!(name: "Jasmine Rice", calories: 500)
      red_pepper = Ingredient.create!(name: "Red Bell Pepper", calories: 100)
      oil = Ingredient.create!(name: "Cooking Oil", calories: 32)

      ingredient_dish_1 = IngredientDish.create(ingredient_id: jasmine_rice.id, dish_id: dish_1.id)
      ingredient_dish_2 = IngredientDish.create(ingredient_id: red_pepper.id, dish_id: dish_1.id)
      ingredient_dish_3 = IngredientDish.create(ingredient_id: oil.id, dish_id: dish_1.id)

      expect(dish_1.total_calories).to eq(632)
    end
  end
end