require 'rails_helper' 

RSpec.describe "Dish Show Page" do
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

      it 'Displays a form to add a ingredient to that dish' do
         visit dish_path(@dish_1)

         expect(page).to have_content("Add Ingredient")

         within "#add_ingredient" do

            fill_in("dish[ingredient_id]", with: @onion.id)

            click_on "Add Ingredient"

            expect(current_path).to eq(dish_path(@dish_1))
         end

         expect(page).to have_content("Total Calories: 350")
      end

      it 'has a button next to each ingredient to delete that ingredient from a dish' do
         visit dish_path(@dish_1)

         within "#ingredients" do
            expect(page).to have_button("Delete")
            expect(page).to have_content("Cooking Oil")

            within "#ingredient_#{@oil.id}" do
               click_on "Delete"
               expect(current_path).to eq(dish_path(@dish_1))
            end
            
            expect(page).to_not have_content("Cooking Oil")
            save_and_open_page
         end
      end
   end
end