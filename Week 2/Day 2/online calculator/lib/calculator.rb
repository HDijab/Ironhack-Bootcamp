module Calculator
  def calculate(first, second, operator)
    first.send(operator, second)
  end
end