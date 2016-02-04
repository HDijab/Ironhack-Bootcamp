# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create name: 'Halil', password: '1234',email: 'halil@gmail.com'
User.create name: 'Dijab', password: '1234',email: 'dijab@gmail.com'

Product.create title: 'Apple', description: 'Watch', deadline: Date.today + 1.month, minimum_bid: 50, user_id: 1
Product.create title: 'Motor', description: 'Phone', deadline: Date.today + 1.month, minimum_bid: 50, user_id: 1

Product.create title: 'Apple', description: '-T-V-', deadline: Date.today + 1.month, minimum_bid: 50, user_id: 2
Product.create title: 'Motor', description: 'Walet', deadline: Date.today + 1.month, minimum_bid: 50, user_id: 2