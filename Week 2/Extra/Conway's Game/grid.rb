require './cell'
require 'pry'

class Grid
  attr_accessor :size, :grid # delete after testing
  def initialize(size)
    @size = size
    @grid = {}
  end

  def create_grid
    @size.times do |i|
      @grid[i + 1] = Array.new(@size, 0)
    end
  end

  # def create_row
    
  # end

  def alive_or_dead
    rand(0..1)
  end
end

grid = Grid.new(10)
grid.create_grid
binding.pry