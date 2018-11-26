# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# meatloaf = Recipe.create({name: "Meatloaf", category: "Entree"})
# meatloaf.amounts.build(ingredient_amount: "10")
# meatloaf.amounts.last.build_ingredient(unit: "lbs", name: "Ground Beef")
# meatloaf.amounts.build(ingredient_amount: "10")
# meatloaf.amounts.last.build_ingredient(unit: "ea", name: "Eggs")
# meatloaf.amounts.build(ingredient_amount: "5")
# meatloaf.amounts.last.build_ingredient(unit: "Cups", name: "Bread Crumbs")
# meatloaf.amounts.build(ingredient_amount: "2")
# meatloaf.amounts.last.build_ingredient(unit: "Cups", name: "Milk")
# meatloaf.save
10.times do
  Ingredient.create({name: Faker::Food.ingredient, unit: Faker::Food.metric_measurement, inventory_amount: Faker::Number.decimal(1)})
end
jeb = User.create(name: 'Jeb', password: '12345', email: 'email@email.com')

20.times do
  recipe = jeb.recipes.build(name: Faker::Food.dish, category: "Entree")
  recipe.amounts.build(ingredient_amount: Faker::Number.decimal(1))
  recipe.amounts.last.build_ingredient(name: Faker::Food.ingredient, unit: Faker::Food.metric_measurement, inventory_amount: Faker::Number.decimal(1))
  recipe.amounts.build(ingredient_amount: Faker::Number.decimal(1))
  recipe.amounts.last.build_ingredient(name: Faker::Food.ingredient, unit: Faker::Food.metric_measurement, inventory_amount: Faker::Number.decimal(1))
  recipe.amounts.build(ingredient_amount: Faker::Number.decimal(1))
  recipe.amounts.last.build_ingredient(name: Faker::Food.ingredient, unit: Faker::Food.metric_measurement, inventory_amount: Faker::Number.decimal(1))
  recipe.amounts.build(ingredient_amount: Faker::Number.decimal(1))
  recipe.amounts.last.build_ingredient(name: Faker::Food.ingredient, unit: Faker::Food.metric_measurement, inventory_amount: Faker::Number.decimal(1))
  recipe.amounts.build(ingredient_amount: Faker::Number.decimal(1))
  recipe.amounts.last.build_ingredient(name: Faker::Food.ingredient, unit: Faker::Food.metric_measurement, inventory_amount: Faker::Number.decimal(1))
  recipe.amounts.build(ingredient_amount: Faker::Number.decimal(1))
  recipe.amounts.last.build_ingredient(name: Faker::Food.ingredient, unit: Faker::Food.metric_measurement, inventory_amount: Faker::Number.decimal(1))
  recipe.save
end
# recipes = []

# recipes = [
#   {
#     name: "Meatloaf",
#     category: "Entree",
#     ingredients: [
#       {
#         ingredient_amount: "10",
#         unit: "lbs",
#         name: "Ground Beef"
#       },
#       {
#         ingredient_amount: "10",
#         unit: "lbs",
#         name: "Ground Beef"
#       }
#       {
#         ingredient_amount: "10",
#         unit: "lbs",
#         name: "Ground Beef"
#       },
#       {
#         ingredient_amount: "10",
#         unit: "lbs",
#         name: "Ground Beef"
#       }
#     ]
#   }
# ]
# recipes.each do |recipe|
#
# end
