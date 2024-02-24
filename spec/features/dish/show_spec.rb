require 'rails_helper' 

RSpec.describe "Dish Show Page" do
   describe 'as a visitor' do
      before(:each) do
         @chef_1 = Chef.create!(name: "Jack S.")
         @dish_1 = @chef_1.dishes.create!(name: "Jollof Rice", description: "Nigerian Cousine")

         @jasmine_rice = Ingredient.create!(name: "Jasmine Rice", calories: 230)
         @red_pepper = Ingredient.create!(name: "Red Bell Pepper", calories: 30)
         @oil = Ingredient.create!(name: "Cooking Oil", calories: 50)

         ingredient_dish_1 = IngredientDish.create(ingredient_id: @jasmine_rice.id, dish_id: @dish_1.id)
         ingredient_dish_2 = IngredientDish.create(ingredient_id: @red_pepper.id, dish_id: @dish_1.id)
         ingredient_dish_3 = IngredientDish.create(ingredient_id: @oil.id, dish_id: @dish_1.id)
      end

      it 'display the dish name, and description' do
         visit dish_path(@dish_1)
         expect(page).to have_content("Jollof Rice")
         expect(page).to have_content("Nigerian Cousine")
         
         within "#ingredients" do
            expect(page).to have_content("Jasmine Rice")
            expect(page).to have_content("Red Bell Pepper")
            expect(page).to have_content("Cooking Oil")
         end

         within "#total_calories" do
            expect(page).to have_content("Calories: 310")
         end

         within "#chef_developer" do
            expect(page).to have_content("Jack S.")
         end
      end
   end
end