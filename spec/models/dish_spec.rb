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
    @chef_1 = Chef.create!({name: "Anthony Bourdain"})

    @dish_1 = @chef_1.dishes.create!({name: "Poulet Basquaise", description: "Quick-braised chicken with cayenne"})

    @ingredient_1 = Ingredient.create!({name: "Chicken", calories: 500})
    @ingredient_2 = Ingredient.create!({name: "Olive Oil", calories: 15})
    @ingredient_3 = Ingredient.create!({name: "Cayenne", calories: 115})

    @dish_ingredient_1 = DishIngredient.create!({dish_id: @dish_1.id, ingredient_id: @ingredient_1.id})
    @dish_ingredient_2 = DishIngredient.create!({dish_id: @dish_1.id, ingredient_id: @ingredient_2.id})
    @dish_ingredient_3 = DishIngredient.create!({dish_id: @dish_1.id, ingredient_id: @ingredient_3.id})
  end

  describe 'Instance Methods' do
    describe '#dish_calorie_content' do
      it "calculates the the total calorie content for a dish" do

        expect(@dish_1.dish_calorie_content).to eq(630)
      end
    end
  end
end