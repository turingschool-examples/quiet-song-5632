require 'rails_helper'

RSpec.describe Ingredient, type: :model do

  describe 'relationships' do
    it { should have_many :dish_ingredients }
    it { should have_many(:dishes).through(:dish_ingredients) }
  end

  before (:each) do
    @chef_1 = Chef.create!({name: "Marco Pierre White"})

      @dish_1 = @chef_1.dishes.create!({name: "Potatoes Gratin", description: "Creamy"})

      @ingredient_1 = Ingredient.create!({name: "Potato", calories: 55})
      @ingredient_2 = Ingredient.create!({name: "Heavy Cream", calories: 145})
      @ingredient_3 = Ingredient.create!({name: "Ricotta Cheese", calories: 200})

      @dish_ingredient_1 = DishIngredient.create!({dish_id: @dish_1.id, ingredient_id: @ingredient_1.id})
      @dish_ingredient_2 = DishIngredient.create!({dish_id: @dish_1.id, ingredient_id: @ingredient_2.id})
  end

  describe 'Instance Methods' do
    describe '#find_dish_ingredient(dish_id)' do
      it 'returns the dish_ingredient object associated with self and the given dish_id' do
        expect(@ingredient_1.find_dish_ingredient(@dish_1.id)).to eq(@dish_ingredient_1)
        expect(@ingredient_2.find_dish_ingredient(@dish_1.id)).to eq(@dish_ingredient_2)
      end
    end
  end
end