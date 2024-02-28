require 'rails_helper' 

RSpec.describe "Chef Show Page" do
   describe 'as a visitor' do
      before(:each) do
         @chef_1 = Chef.create!(name: "Jack S.")
         @dish_1 = @chef_1.dishes.create!(name: "Jollof Rice", description: "Nigerian Cousine")

         @jasmine_rice = Ingredient.create!(name: "Jasmine Rice", calories: 230)
         @red_pepper = Ingredient.create!(name: "Red Bell Pepper", calories: 30)
         @oil = Ingredient.create!(name: "Cooking Oil", calories: 50)

         @onion = Ingredient.create!(name: "Yellow Onions", calories: 40)

         ingredient_dish_1 = IngredientDish.create(ingredient_id: @jasmine_rice.id, dish_id: @dish_1.id)
         ingredient_dish_2 = IngredientDish.create(ingredient_id: @red_pepper.id, dish_id: @dish_1.id)
         ingredient_dish_3 = IngredientDish.create(ingredient_id: @oil.id, dish_id: @dish_1.id)

      end

      it 'displays a link to view all the ingredients this chef uses in their dishes' do
         visit chef_path(@chef_1)

         expect(page).to have_link("Chef's Ingredients", href: chef_ingredients_path(@chef_1))

         click_on "Chef's Ingredients"

         expect(current_path).to eq(chef_ingredients_path(@chef_1))
         expect(page).to have_content("Jasmine Rice")
         expect(page).to have_content("Red Bell Pepper")
         expect(page).to have_content("Cooking Oil")
         expect(page).to_not have_content("Yellow Onions")
      end
   end
end
