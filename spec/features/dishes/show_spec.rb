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

    describe 'User story 1' do
        it 'shows a dish name and description' do
            visit dish_path(@cheesecake)
            expect(page).to have_content("Cheesecake")
            expect(page).to have_content("So dang good")
        end

        it 'has the calorie count' do
            visit dish_path(@cheesecake)
            expect(page).to have_content(300)
        end

        it 'has the dishs chefs name' do
            visit dish_path(@cheesecake)
            expect(page).to have_content("Joe")
        end

        it 'has a list of the dishs ingredients' do
            visit dish_path(@cheesecake)

            expect(page).to have_content("Yeast")
            expect(page).to_not have_content("Cinnamon")
            expect(page).to_not have_content("Flour")
        end
    end

    describe 'User story 2' do
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

        it 'has a form to add existing ingredients to a dish' do
            visit dish_path(@chicago_deep_dish)

            expect(page).to have_button("Submit")
        end

        it 'adds a dish with id number of ingredient in dB' do
            visit dish_path(@chicago_deep_dish)


            expect(page).to have_content("Yeast")
        end

        it 'redirects to dish show page after submission to display added ingredient' do
            visit dish_path(@chicago_deep_dish)


            expect(page).to have_content("Yeast")
        end
    end
end
