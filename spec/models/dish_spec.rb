require 'rails_helper'

RSpec.describe Dish, type: :model do

  describe "validations" do
      it {should validate_presence_of :name}
      it {should validate_presence_of :description}
  end

  describe "relationships" do
      it {should belong_to :chef}
      it { should have_many :dish_ingredients }
      it { should have_many(:ingredients).through(:dish_ingredients) }
  end

  describe 'total_calories' do
    it 'counts total amount of calories to a dish' do
      @chef = Chef.create(name: 'Bob')
      @dish = @chef.dishes.create(name: 'Lasagna',description: 'Delicious food')
      @dish2 = @chef.dishes.create(name: 'Pizza',description: 'Delicious food')
      
      @ingredient1 = Ingredient.create(name: 'Pasta', calories: 200)
      @ingredient2 = Ingredient.create(name: 'Cheese', calories: 300)
      @ingredient3 = Ingredient.create(name: 'Jelly', calories: 200)
  
      DishIngredient.create(dish:@dish, ingredient: @ingredient1)
      DishIngredient.create(dish:@dish, ingredient: @ingredient2)
      DishIngredient.create(dish:@dish2, ingredient: @ingredient1)
      DishIngredient.create(dish:@dish2, ingredient: @ingredient2)
      DishIngredient.create(dish:@dish2, ingredient: @ingredient3)

      expect(@dish.total_calories).to eq(500)
      expect(@dish2.total_calories).to eq(700)
    end
  end

end