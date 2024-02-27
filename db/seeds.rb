# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
@chef = Chef.create(name: "Alex")
@dish = @chef.dishes.create!(name: "test", description: "im a good dish")
@ingredient = Ingredient.create!(name: "salt", calories: 12)
@ingredient_1 = Ingredient.create!(name: "pepper", calories: 20)
@dish_ingredient = DishIngredient.create!(dish_id: @dish.id, ingredient_id: @ingredient.id)
@dish_ingredient_1 = DishIngredient.create!(dish_id: @dish.id, ingredient_id: @ingredient_1.id)