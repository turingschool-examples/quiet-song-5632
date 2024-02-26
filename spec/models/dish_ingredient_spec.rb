require 'rails_helper'

RSpec.describe DishIngredient, type: :model do
#  describe 'validations' do
#   it { should validate_presence_of : }
#  end

 describe 'relationships' do
  it { should belong_to :dish }
  it { should belong_to :ingredient }
 end

 describe 'instance methods' do
 end
end