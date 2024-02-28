class Chef < ApplicationRecord
   validates_presence_of :name
   has_many :dishes

   has_many :table_ingredients, through: :dishes
   
   def list_of_ingredients
      self.table_ingredients.distinct
   end
end