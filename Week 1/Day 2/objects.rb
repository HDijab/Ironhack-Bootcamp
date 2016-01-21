require 'pry'

class Car #:nodoc:
  # Can be omitted
  attr_reader :cities

  def self.honk(car, amount = 2)
    amount.times { car.make_noise }
  end

  def initialize(noise)
    @noise = noise
    @cities = []
  end

  # def cities=(city)
  #   @cities = city
  # end

  def make_noise
    puts @noise
  end

  def visited_city(city)
    @cities << city
    @cities.flatten! if city.is_a?(Array)
    # Or #{self.object_id}
    IO.write("#{self}.txt", "#{@cities}")
  end
end

# car = Car.new('Broom')
# new_car = Car.new('BROOOOOOM')

# car.make_noise
# new_car.make_noise

# car.visited_city(%w(Barcelona Alcoy Capo\ de\ Gata Malaga))
# car.visited_city('Madrid')

# new_car.visited_city('London')
# new_car.visited_city('Kent')
# new_car.visited_city('Sheffield')
# new_car.visited_city('Leeds')

class Racecar < Car #:nodoc:
  def initialize
    super('BROOOM')
  end
end

# racer = Racecar.new
# racer.cities = 'hello'
# puts racer.cities
# racer.make_noise
# racer.visited_city('Madrid')
