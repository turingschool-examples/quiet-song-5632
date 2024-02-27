require 'rails_helper'

RSpec.describe 'Chef Show Page' do
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
        # flour is the one not in any of joe's dishes

    end

    describe 'User story 3' do
        it 'has a link to view all ingredients' do
            expect(page).to have_content("See all ingredients for Joe")
            expect(page).to have_link('TEXT', href: path)
        end

        it 'redirects to the chef ingredients index page with a list of all ingredients for the chef' do
            click_on 'See all ingredients for Joe'
            
            expect(current_path).to_be ""
            expect(page).to have_content("Yeast")
            expect(page).to have_content("Cinnamon")
            expect(page).to_not have_content("Flour")
        end
    end
end