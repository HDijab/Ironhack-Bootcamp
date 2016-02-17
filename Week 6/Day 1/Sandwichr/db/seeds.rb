# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Ingredient.create(name: 'cheese', calorie: 100)
Ingredient.create(name: 'ham', calorie: 100)
Ingredient.create(name: 'bacon', calorie: 100)
Ingredient.create(name: 'lettuce', calorie: 100)
Ingredient.create(name: 'tomato', calorie: 100)

bikini = Sandwich.create(name: 'bikini', bread_type: 'white')
bikini.ingredients.push(Ingredient.find_by('name == ?', 'cheese'))
bikini.ingredients.push(Ingredient.find_by('name == ?', 'ham'))

blt = Sandwich.create(name: 'BLT', bread_type: 'brown')
blt.ingredients.push(Ingredient.find_by('name == ?', 'bacon'))
blt.ingredients.push(Ingredient.find_by('name == ?', 'lettuce'))
blt.ingredients.push(Ingredient.find_by('name == ?', 'tomato'))
