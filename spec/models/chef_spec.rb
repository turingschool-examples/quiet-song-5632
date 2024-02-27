require 'rails_helper'

RSpec.describe Chef, type: :model do

  describe "validations" do
      it {should validate_presence_of :name}
  end

  describe "relationships" do
      it { should have_many :dishes }
      it { should have_many(:ingredients).through(:dishes) }
  end

  before (:each) do
    @chef_1 = Chef.create!({name: "Marco Pierre White"})

      @dish_1 = @chef_1.dishes.create!({name: "Potatoes Gratin", description: "Creamy"})
      @dish_2 = @chef_1.dishes.create!({name: "Potatoes", description: "Dry"})

      @ingredient_1 = Ingredient.create!({name: "Potato", calories: 55})
      @ingredient_2 = Ingredient.create!({name: "Heavy Cream", calories: 145})
      @ingredient_3 = Ingredient.create!({name: "Ricotta Cheese", calories: 200})

      @dish_ingredient_1 = DishIngredient.create!({dish_id: @dish_1.id, ingredient_id: @ingredient_1.id})
      @dish_ingredient_2 = DishIngredient.create!({dish_id: @dish_1.id, ingredient_id: @ingredient_2.id})
      @dish_ingredient_3 = DishIngredient.create!({dish_id: @dish_1.id, ingredient_id: @ingredient_3.id})
      @dish_ingredient_4 = DishIngredient.create!({dish_id: @dish_1.id, ingredient_id: @ingredient_1.id})
  end

  describe "Instance Methods" do
    describe '#unique_ingredients' do
      it 'returns an array of unique ingredients used in a chefs dishes' do
        expect(@chef_1.unique_ingredients).to eq([@ingredient_1, @ingredient_2, @ingredient_3])
      end
    end
  end
end