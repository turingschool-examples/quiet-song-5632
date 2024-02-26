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

  before(:each) do
    @chef_1 = Chef.create!(name: "Isaac")
    
    @dish_1 = @chef_1.dishes.create!(name: "Burger", description: "Big mac copy")

    @ingredient_bun = Ingredient.create!(name: "Bread", calorie_count: 10)
    @ingredient_lettuce = Ingredient.create!(name: "Lettuce", calorie_count: 1)
    @ingredient_meat = Ingredient.create!(name: "Meat", calorie_count: 15)
    @ingredient_tomatoe = Ingredient.create!(name: "Tomatoe", calorie_count: 1)
    
    @dish_ingredient = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_bun.id)
    @dish_ingredient = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_meat.id)
    @dish_ingredient = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_lettuce.id)
    @dish_ingredient = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_tomatoe.id)
  end

  describe "instance_methods" do
    describe "#tot_calorie_count" do
      it "returns the correct total of calorie count" do
        expect(@dish_1.tot_calorie_count).to eq(27)
      end
    end
  end

end