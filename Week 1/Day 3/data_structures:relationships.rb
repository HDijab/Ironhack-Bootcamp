require 'pry'
############################################################### DATA STRUCTURES
# hash = {wat: [0, 1, {wut: [0, [[0,1,2,3,4,5,6,7,8,{bbq: 'Hello, '}]]]}]}
# arr = [[0,1,2,3,4,{secret: {unlock: [0, 'World!']}}]]

# print hash[:wat][2][:wut][1][0][9][:bbq]
# puts arr[0][5][:secret][:unlock][1]
######################################################### DATA STRUCTURES EXTRA
# class CarDealer
#   def initialize(inventory)
#     @inventory = inventory
#     # @colors = colors
#   end

#   def cars(brand)
#   #   puts brand + ':'
#   #   @inventory[brand.downcase.to_sym].each do |car|
#   #     puts car + ', available colors:'
#   #     puts @colors[car.downcase.to_sym]
#   #     puts
#   #   end
#   # end
#   puts @inventory[brand.downcase.to_sym]
#   end
# end

# inventory = {
#   ford: [
#     ['Fiesta', ['Black', 'White', 'Blue']],
#     ['Mustang', ['Black', 'White', 'Blue']]
#     ],
#   seat: [
#     ['Ibiza', ['Black', 'White', 'Blue']],
#     ['Leon', ['Black', 'White', 'Blue']],
#     ['Toledo', ['Black', 'White', 'Blue']]
#   ]
# }

# colors = {
#   fiesta: ['Black', 'White', 'Blue'],
#   mustang: ['Black', 'White', 'Blue'],
#   ibiza: ['Black', 'White', 'Blue'],
#   leon: ['Black', 'White', 'Blue'],
#   toledo: ['Black', 'White', 'Blue']
# }

# car_dealer = CarDealer.new(inventory)
# car_dealer.cars('Ford')
########################################################## DEPENDENCY INJECTION
# class Car
#   def initialize(engine)
#     @engine = engine
#     @noise = 'Tik-Tik '
#   end

#   def on_off
#     make_noise unless @engine.state
#     @engine.on_off
#   end

#   def make_noise
#     puts @noise + @engine.noise
#   end

#   def running?
#     puts @engine.state
#   end
# end

# class Engine
#   attr_reader :state, :noise, :pistons
#   def initialize(pars={}, pistons=4)
#     @state = false
#     @noise = pars[:noise]
#     @pistons = pars[:pistons] ||= pistons
#   end

#   def on_off
#     @state = !@state
#   end
# end

# engines = {
#   honda: {noise: 'bop'},
#   toyota: {noise: 'Brroomm', pistons: 6},
#   maserati: {noise: 'BRROOMM', pistons: 8},
#   ferrari: {noise: 'BRRROOOMMM', pistons: 12}
# }

# honda = Car.new(Engine.new(engines[:honda]))
# toyota = Car.new(Engine.new(engines[:toyota]))
# maserati = Car.new(Engine.new(engines[:maserati]))
# ferrari = Car.new(Engine.new(engines[:ferrari]))

# honda.on_off
# toyota.on_off
# maserati.on_off
# ferrari.on_off
################################################################### DUCK TYPING
# class Vehicle1
#   attr_reader :wheels
#   def initialize
#     @wheels = 4
#   end

#   def noise
#     'bop'
#   end
# end

# class Vehicle2
#   attr_reader :wheels
#   def initialize
#     @wheels = 5
#   end

#   def noise
#     'booooop'
#   end
# end

# class Vehicle3
#   attr_reader :wheels
#   def initialize
#     @wheels = 6
#   end

#   def noise
#     'BOOOP'
#   end
# end

# class WheelCounter
#   def wheels
#     cars = [Vehicle1.new, Vehicle2.new, Vehicle3.new]
#     wheels = cars.reduce(0) do |sum, car|
#       sum + car.wheels
#     end
#     puts wheels
#   end
# end

# class NoiseMaker
#   def noiser
#     cars = [Vehicle1.new, Vehicle2.new, Vehicle3.new]
#     noise = cars.map do |car|
#       car.noise
#     end
#     puts noise
#   end
# end

# WheelCounter.new.wheels
# NoiseMaker.new.noiser
