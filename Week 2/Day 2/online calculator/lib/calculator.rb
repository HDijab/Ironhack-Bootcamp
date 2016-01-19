class Calculator
  def initialize(args={})
    @a = args[:first_number]
    @b = args[:second_number]
    @operator = args[:operator]
  end

  def calculate
    @a.send(@operator, @b)
  end
end