# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# chef
joe = Chef.create!(name: "Joe")

# dishes
cheesecake = Dish.create!(name: "Cheesecake", description: "So dang good")
chicago_deep_dish = Dish.create!(name: "Chicago Deep Dish", description: "The best pizza around")

# ingredients
cheese = Ingredient.create!(name: "Cheese")
yeast = Ingredient.create!(name: "Yeast")
flour = Ingredient.create!(name: "Flour")