require 'rails_helper'

RSpec.describe Dish, type: :model do

  describe "validations" do
      it {should validate_presence_of :name}
      it {should validate_presence_of :description}
  end

  describe "relationships" do
      it {should belong_to :chef}
      it {should have_many :dish_ingredients}
      it {should have_many(:table_ingredients).through(:dish_ingredients)}
  end

  before(:each) do
    @chef_1 = Chef.create(name: "Luis")

    @dish_1 = @chef_1.dishes.create!(name: "Bandeja Paisa", description: "good food")

    @ingredient_1 = TableIngredient.create!(name: "Chorizo", calories: 20)
    @ingredient_2 = TableIngredient.create!(name: "Eggs", calories: 20)

    @dish_ingredient_1 = DishIngredient.create!(dish_id: @dish_1.id, table_ingredient_id: @ingredient_1.id)
    @dish_ingredient_2 = DishIngredient.create!(dish_id: @dish_1.id, table_ingredient_id: @ingredient_2.id)
  end
  describe 'instance#methods' do
    it '#total_calories_count' do
      expect(@dish_1.total_calories_count).to eq(40)
    end
  end
end