# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
jeb = User.create(name: 'Jeb', password: '12345', email: 'email@email.com')
meatloaf = Recipe.create({name: "Meatloaf", category: "Entree"})
meatloaf.amounts.build(ingredient_amount: "10")
meatloaf.amounts.last.build_ingredient(unit: "lbs", name: "Ground Beef")
meatloaf.amounts.build(ingredient_amount: "10")
meatloaf.amounts.last.build_ingredient(unit: "ea", name: "Eggs")
meatloaf.amounts.build(ingredient_amount: "5")
meatloaf.amounts.last.build_ingredient(unit: "Cups", name: "Bread Crumbs")
meatloaf.amounts.build(ingredient_amount: "2")
meatloaf.amounts.last.build_ingredient(unit: "Cups", name: "Milk")
meatloaf.save
jeb.recipes << meatloaf
# recipes = []
# 100.times do
#   # use faker to create a new recipe
# end
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
