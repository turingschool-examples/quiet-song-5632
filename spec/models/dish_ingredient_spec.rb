require 'rails_helper'

RSpec.describe DishIngredient, type: :model do
  describe 'relationships' do
    it {should belong_to :dish}
    it {should belong_to :table_ingredient}
  end

  describe 'instance methods' do
  end
end