class Chef < ApplicationRecord
   validates_presence_of :name
   
   has_many :dishes, dependent: :destroy
   has_many :ingredients, through: :dishes

   def list_ingredients
      ingredients.pluck(:name)
   end
end