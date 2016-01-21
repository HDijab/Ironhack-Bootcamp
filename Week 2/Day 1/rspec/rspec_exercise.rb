class FizzBuzz
  def initialize
    @values = {
      fizz: 3,
      buzz: 5,
      dude: 7
    }
  end

  def normalize(number)
    result = ""
    @values.each do |key, value|
      if number % value == 0
        result += key.to_s.capitalize
      end
    end
    result = number if result == ""
    result
  end
end