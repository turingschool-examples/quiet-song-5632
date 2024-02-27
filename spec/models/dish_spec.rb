require 'rails_helper'

RSpec.describe Dish, type: :model do

  describe "validations" do
      it {should validate_presence_of :name}
      it {should validate_presence_of :description}
  end

  describe "relationships" do
      it {should belong_to :chef}
      it {should have_many :dish_ingredients }
      it { should have_many(:ingredients).through(:dish_ingredients) }
  end

  it "#add_ingredient" do
    joe = Chef.create!(name: "Joe")
    cheesecake = Dish.create!(name: "Cheesecake", description: "So dang good", chef: joe, total_calories: 300)

    cinnamon = Ingredient.create!(name: "Cinnamon")
    yeast = Ingredient.create!(name: "Yeast")
    flour = Ingredient.create!(name: "Flour") 

    cheesecake.add_ingredient(cinnamon.id)
    cheesecake.add_ingredient(flour.id)

    expect(cheesecake.ingredients.pluck(:id)).to include(flour.id)
    expect(cheesecake.ingredients.pluck(:id)).to include(cinnamon.id)
    expect(cheesecake.ingredients.pluck(:id)).to_not include(yeast.id)
  end

end