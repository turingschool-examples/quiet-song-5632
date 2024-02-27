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

        # add dishes to chef
        @joe.dishes << @cheesecake
        @joe.dishes << @chicago_deep_dish

        # put ingredients with dishes
        @cheesecake.ingredients << @yeast
        @chicago_deep_dish.ingredients << @cinnamon
        # flour is the one not in any of joe's ingredients

    end

    describe 'User story 3' do
        it 'has a link to view all ingredients' do
            visit "/chefs/#{@joe.id}"

            save_and_open_page
            expect(page).to have_content("See all ingredients for this chef")
            expect(page).to have_link('See all ingredients for this chef', href: "/chefs/#{@joe.id}/ingredients")
        end

        it 'redirects to the chef ingredients index page with a list of all ingredients for the chef' do
            visit "/chefs/#{@joe.id}"
            click_on 'See all ingredients for this chef'
            
            expect(current_path).to_be "/chefs/#{@joe.id}/ingredients"
            expect(page).to have_content("Yeast")
            expect(page).to have_content("Cinnamon")
            expect(page).to_not have_content("Flour")
        end
    end
end