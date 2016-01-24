class Cell
  def initialize(state, neighbours)
    @state = state # either 1 or 0 for alive or dead
    @neighbours = neighbours # an array that represents the surrounding cells
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

  def count_neighbours
    @neighbours.reduce(:+)
  end
end
