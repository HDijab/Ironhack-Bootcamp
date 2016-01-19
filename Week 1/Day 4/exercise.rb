require 'pry'

# Buy 2 apples and pay just one!
# Buy 3 oranges and pay just 2!
# Buy 4 grapes you get one banana for free if you want!

module Price
  def price(item)
    items_list = {
    apple: 10,
    orange: 5,
    grape: 15,
    banana: 20,
    watermelon: 50
    }
    return items_list[item]
  end
end

class ShoppingCart
  include Price

  attr_reader :contents
  def initialize
    @contents = {}
  end

  def add_item_to_cart(item)
    if @contents.has_key?(item)
      @contents[item] += 1
    else
      @contents[item] = 1
    end
  end

  def show
    @contents.each do |key, value|
      if value > 1
        puts "#{value}- #{key}s: #{price(key) * value}$"
      else
        puts "#{value}- #{key}: #{price(key) * value}$"
      end
    end
  end

  def cost
    total = @contents.reduce(0) do |sum, (key, value)|
      sum + price(key) * value
    end
    puts total
  end
end

cart = ShoppingCart.new
cart.add_item_to_cart(:apple)
cart.add_item_to_cart(:banana)
cart.add_item_to_cart(:banana)
cart.show
cart.cost
