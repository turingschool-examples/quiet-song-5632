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
    @chef_1 = Chef.create!(name: "Bobby")

    @dish_1 = @chef_1.dishes.create!(name: "Slime", description: "Green Ooze")

    @ingred_1 = Ingredient.create!(name: "Unknown", calories: 100)
    @ingred_2 = Ingredient.create!(name: "Beans", calories: 60)
    @ingred_3 = Ingredient.create!(name: "Mysterious Liquid", calories: 1000)

    DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingred_1.id)
    DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingred_3.id)
  end

  describe "instance methods" do 
    describe "#total_calorie_count" do 
      it "gives the sum of total calories in a dish" do 
        expect(@dish_1.total_calorie_count).to eq(1100)
      end
    end
  end
end