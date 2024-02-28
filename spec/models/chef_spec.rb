require 'rails_helper'

RSpec.describe Chef, type: :model do

  describe "validations" do
      it {should validate_presence_of :name}
  end

  describe "relationships" do
      it {should have_many :dishes}
      it {should have_many(:dish_ingredients).through(:dishes)}
      it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  before(:each) do
    @chef_1 = Chef.create!(name: "Bobby")
    @chef_2 = Chef.create!(name: "Gordon")

    @dish_1 = @chef_1.dishes.create!(name: "Slime", description: "Green Ooze")
    @dish_2 = @chef_2.dishes.create!(name: "Beer", description: "Ipa")

    @ingred_1 = Ingredient.create!(name: "Unknown", calories: 100)
    @ingred_2 = Ingredient.create!(name: "Beans", calories: 60)
    @ingred_3 = Ingredient.create!(name: "Mysterious Liquid", calories: 1000)
    @ingred_4 = Ingredient.create!(name: "Wheat", calories: 1000)

    DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingred_1.id)
    DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingred_3.id)
    DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @ingred_2.id)
    DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @ingred_4.id)
  end

  describe "instance methods" do 
    describe "#unique_ingredients" do 
      it "shows ingredients that only that chef uses" do 
        expect(@chef_1.unique_ingredients).to eq([@ingred_1, @ingred_3])
        expect(@chef_2.unique_ingredients).to eq([@ingred_2, @ingred_4])
      end
    end
  end
end