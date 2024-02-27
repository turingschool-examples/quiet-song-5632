require 'rails_helper'

RSpec.describe Dish, type: :model do

  describe "validations" do
      it {should validate_presence_of :name}
      it {should validate_presence_of :description}
  end

  describe "relationships" do
      it {should belong_to :chef}
      it { should have_many :dish_ingredients}
      it { should have_many(:ingredients).through(:dish_ingredients)}
  end
  describe "class methods" do
    before(:each) do
      @chef = Chef.create(name: "Alex")
      @dish = @chef.dishes.create!(name: "test", description: "im a good dish")
      @ingredient = Ingredient.create!(name: "salt", calories: 12)
      @ingredient_1 = Ingredient.create!(name: "pepper", calories: 20)
      @dish_ingredient = DishIngredient.create!(dish_id: @dish.id, ingredient_id: @ingredient.id)
      @dish_ingredient_1 = DishIngredient.create!(dish_id: @dish.id, ingredient_id: @ingredient_1.id)
    end
    
    it "returns total calorie" do
      expect(@dish.calorie_count).to eq(32)
    end
  end
  

end