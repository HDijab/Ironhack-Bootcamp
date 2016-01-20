require './lib/calculator'
require './lib/save_load'

class Logic
  include Calculator
  include SaveLoad

  def initialize(args={})
    @first = args[:first_number]
    @second = args[:second_number]
    @operator = args[:operator]
    @saved = args[:saved_result]
    @load = args[:load_result]
  end

  def action
    @saved and store
    @load and return reload
    @operator and result
  end

  def result
    calculate(@first.to_f, @second.to_f, @operator.to_sym)
  end

  def store
    save(@saved)
  end

  def reload
    return load
  end
end