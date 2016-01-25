class Cell
  attr_reader :state
  def initialize(state)
    @state = state
    @neighbours = []
  end

  def alive?
    @state
  end

  def regenerate
    @state = decide
  end

  def decide
    if count_neighbours > 3
      return 0
    elsif count_neighbours < 2
      return 0
    elsif count_neighbours == 3
      return 1
    else
      return 1
    end
  end

  def ping_neighbours
    
  end

  def count_neighbours
    @neighbours.reduce(:+)
  end
end
