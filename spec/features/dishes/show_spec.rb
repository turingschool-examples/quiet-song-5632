require 'rails_helper'

RSpec.describe 'Dish Show Page' do
    before :each do
        # create chef
        @joe = Chef.create!(name: "Joe")

        # create dishes
        @cheesecake = Dish.create!(name: "Cheesecake", description: "So dang good", chef: @joe, total_calories: 300)
        @chicago_deep_dish = Dish.create!(name: "Chicago Deep Dish", description: "The best pizza around", chef: @joe, total_calories: 500)

        # create ingredients
        @cinnamon = Ingredient.create!(name: "Cinnamon")
        @yeast = Ingredient.create!(name: "Yeast")
        @flour = Ingredient.create!(name: "Flour")

        # put ingredients with dishes
        @cheesecake.ingredients << @yeast
        @chicago_deep_dish.ingredients << @cinnamon
        @chicago_deep_dish.ingredients << @flour
    end

    xdescribe 'User story 2' do
        it 'has a form to add existing ingredients to a dish' do
            visit "/dishes/#{@chicago_deep_dish.id}"
            save_and_open_page
            expect(page).to have_button("Submit")
        end
    
        it 'adds a dish with id number of ingredient in dB' do
            visit "/dishes/#{@chicago_deep_dish.id}"

            fill_in 'ingredient_id', with: @yeast.id 
            click_on 'Submit'

            expect(page).to have_content("Yeast")
        end
    
        it 'redirects to dish show page after submission to display added ingredient' do
            visit "/dishes/#{@chicago_deep_dish.id}"
        
            fill_in 'ingredient_id', with: @yeast.id 
            click_on 'Submit'
        
            expect(page).to have_content("Yeast")
            expect(current_path).to eq "/dishes/#{@chicago_deep_dish.id}"
        end
    end
end
