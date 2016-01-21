require 'pry'
class Home #:nodoc:
  attr_reader(:name, :city, :capacity, :price)

  def initialize(name, city, capacity, price)
    @name = name
    @city = city
    @capacity = capacity
    @price = price
  end
end

homes = [
  Home.new("Nizar's place", 'San Juan', 2, 42),
  Home.new("Fernando's place", 'Seville', 5, 47),
  Home.new("Josh's place", 'Pittsburgh', 3, 41),
  Home.new("Gonzalo's place", 'Málaga', 4, 43),
  Home.new("Nicola's place", 'Paris', 6, 44),
  Home.new("Arnold's place", 'Frankfurt', 3, 41),
  Home.new("Roberto's place", 'Barcelona', 7, 45),
  Home.new("John's place", 'London', 3, 46),
  Home.new("Frederico's place", 'Málaga', 2, 45),
  Home.new("Ariel's place", 'San Juan', 4, 49)
]

class BNB #:nodoc:
  def initialize(homes)
    @homes = homes
    @cities = @homes.map { |hm| hm.city.downcase }
    @prices = @homes.map(&:price)
    @capacities = @homes.map(&:capacity)
    @options = %w(List Sort Average Find Quit)
  end

  def intro
    puts 'Welcome to TextBNB, what would you like to do?'
    puts 'Options: '
  end

  def launch
    intro
    @options.each { |option| print option + ' ' }
    puts
    choice = nil
    until choice == :quit
      action, arg = get_action
      choice = do_action(action, arg)
    end
    puts 'Thank You!'
  end

  def display(array)
    array.each do |item|
      puts "#{item.name} in #{item.city} with capacity #{item.capacity} \n
      Price: $#{item.price} a night\n\n"
    end
  end

  def get_action
    print '> '
    user_response = gets.chomp.downcase
    arg = user_response.split(' ')
    action = arg.shift
    return action, arg
  end

  def do_action(action, arg)
    case action
    when 'list'
      display(@homes)
    when 'sort'
      sort(arg[0], arg[1])
    when 'average'
      average(arg[0])
    when 'find'
      filter(arg[0], arg[1])
    when 'quit'
      :quit
    else
      puts "Sorry I didn't understand you"
    end
  end

  def sort(main, order)
    options = %w(price capacity city)
    sort_extra(order, main.to_sym) if options.include?(main)
  end

  def sort_extra(order, reason)
    if order == 'az'
      sorted = @homes.sort_by(&reason)
    elsif order == 'za'
      sorted = @homes.sort_by(&reason).reverse
    end
    display(sorted)
  end

  def filter(main, keyword)
    case main
    when 'city'
      filtered = @homes.select { |hm| hm.city.downcase == keyword }
    when 'price'
      filtered = @homes.select { |hm| hm.price == keyword.to_i }
    when 'capacity'
      filtered = @homes.select { |hm| hm.capacity == keyword.to_i }
    end
    display(filtered)
  end

  def average(arg)
    if arg == 'price'
      average = @prices.reduce(0.0) { |sum, after| sum += after } / @prices.size
    elsif arg == 'capacity'
      average = @capacities.reduce { |sum, after| sum += after } / @capacities.size
    end
    puts average
  end
end

textbnb = BNB.new(homes)
textbnb.launch
