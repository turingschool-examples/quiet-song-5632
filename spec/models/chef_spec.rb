require 'rails_helper'

RSpec.describe Chef, type: :model do

  describe "validations" do
      it {should validate_presence_of :name}
  end

  describe "relationships" do
      it {should have_many :dishes}
      it { should have_many(:dish_ingredients).through(:dishes) }
      it { should have_many(:ingredients).through(:dish_ingredients) }
  end

  describe 'unique_ingredients' do
    it 'returns unique ingredients of a chef' do
      @chef = Chef.create(name: 'Bob')
      @chef2 = Chef.create(name: 'Luke')
      @dish = @chef.dishes.create(name: 'Lasagna',description: 'Delicious food')
      @dish2 = @chef2.dishes.create(name: 'Pizza',description: 'food')
      
      @ingredient1 = Ingredient.create(name: 'Pasta', calories: 200)
      @ingredient2 = Ingredient.create(name: 'Cheese', calories: 300)
      @ingredient3 = Ingredient.create(name: 'Shrimp', calories: 400)

      DishIngredient.create(dish:@dish, ingredient: @ingredient1)
      DishIngredient.create(dish:@dish, ingredient: @ingredient2)
      DishIngredient.create(dish:@dish, ingredient: @ingredient2)
      DishIngredient.create(dish:@dish, ingredient: @ingredient3)

      DishIngredient.create(dish:@dish2, ingredient: @ingredient3)
      DishIngredient.create(dish:@dish2, ingredient: @ingredient3)
      DishIngredient.create(dish:@dish2, ingredient: @ingredient3)

      expect(@chef.unique_ingredients).to eq(["Cheese", "Pasta", "Shrimp"])
      expect(@chef2.unique_ingredients).to eq(["Shrimp"])
    end
  end

end