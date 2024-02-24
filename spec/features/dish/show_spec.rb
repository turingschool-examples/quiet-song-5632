require 'rails_helper' 

RSpec.describe "Dish Show Page" do
   describe 'as a visitor' do
      before(:each) do
         @chef_1 = Chef.create!(name: "Jack S.")
         @dish_1 = @chef_1.dishes.create!(name: "Jollof Rice", description: "Nigerian Cousine")

         @jasmine_rice = Ingredient.create!(name: "Jasmine Rice", calories: 230)
         @red_pepper = Ingredient.create!(name: "Red Bell Pepper", calories: 30)
         @oil = Ingredient.create!(name: "Cooking Oil", calories: 50)
      end

      it 'display the dish name, and description' do
         visit dish_path(@dish_1)

         expect(page).to have_content("Jollof Rice")
         expect(page).to have_content("Jasmine Rice")
         expect(page).to have_content("Red Bell Pepper")
         expect(page).to have_content("Cooking Oil")
         expect(page).to have_content("Calories: 310")
         expect(page).to have_content("Jack S.")
      end
   end
end