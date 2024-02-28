require 'rails_helper'

RSpec.describe Dish, type: :model do

  describe "validations" do
      it {should validate_presence_of :name}
      it {should validate_presence_of :description}
  end

  describe "relationships" do
      it { should belong_to :chef }
      it { should have_many :dish_ingredients }
      it { should have_many(:ingredients).through(:dish_ingredients) }
  end

  before (:each) do
    @chef_1 = Chef.create!({name: "Marco Pierre White"})
    @chef_2 = Chef.create!({name: "Roy Choy"})

    @dish_1 = @chef_1.dishes.create!({name: "Potatoes Gratin", description: "Creamy"})
    @dish_2 = @chef_2.dishes.create!({name: "Potatoes", description: "Dry"})

    @ingredient_1 = Ingredient.create!({name: "Potato", calories: 55})
    @ingredient_2 = Ingredient.create!({name: "Heavy Cream", calories: 145})

    @dish_ingredient_1 = DishIngredient.create!({dish_id: @dish_1.id, ingredient_id: @ingredient_1.id})
    @dish_ingredient_2 = DishIngredient.create!({dish_id: @dish_1.id, ingredient_id: @ingredient_2.id})
    @dish_ingredient_3 = DishIngredient.create!({dish_id: @dish_2.id, ingredient_id: @ingredient_1.id})
  end

  describe 'Instance Methods' do
    describe '#dish_calories' do
      it 'returns the total amount of calories from all ingredients in the dish' do

        expect(@dish_1.dish_calories).to eq(200)
        expect(@dish_2.dish_calories).to eq(55)
      end
    end

    describe '#ingredient_names' do
      it 'returns an array of the ingredient names for a dish' do
        expect(@dish_1.ingredient_names).to eq(["Potato", "Heavy Cream"])
        expect(@dish_2.ingredient_names).to eq(["Potato"])
      end
    end
  end
end