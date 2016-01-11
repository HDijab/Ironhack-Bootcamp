# fruits = ['orange', 'banana', 'pineapple']
# fruits.each do |one_fruit|
#   puts one_fruit
# end

# people = {
#   name: 'John',
#   surname: 'Doe'
# }
# people.each do |key, value|
#   puts "#{key} is #{value}"
# end

# classmates = ['Jack', 'Wally', 'Joey']
# classmates.each do |mate|
#   puts "Good morning #{mate}!"
# end

# total = []
# [1, 2, 3].each do |item|
#   total.push(item + 1)
# end
# puts total

# cities = ['miami', 'madrid', 'barcelona']
#
# capitalized = cities.map do |city|
#   city.capitalize
# end
# OR
# capitalized = cities.map { |city| city.capitalize }
#
# puts capitalized

# total = 0
# n_to_sum = [1, 2, 3]
# n_to_sum.each do |single_number|
#   total += single_number
# end
# puts total

# cities = ['miami', 'madrid', 'barcelona']
# longest = cities.reduce do |longer, current|
#   longer.length > current.length ? longer : current
# end
# puts longest

# just_odds = [5, 2, 3].select { |current_num| current_num.odd? }#(&:odd?)as arg
# puts just_odds
