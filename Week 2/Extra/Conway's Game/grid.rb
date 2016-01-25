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
      @grid[i + 1] = create_row
    end
    show_grid
  end

  def create_row
    row = []
    @size.times do
      row << alive_or_dead
    end
    row
  end

  def alive_or_dead
    Cell.new(rand(0..1))
  end

  def show_grid
    @grid.each do |k, v|
      v.each do |cell|
        print cell.state.to_s + ' '
      end
      puts
    end
  end

  def ping
    @grid.each do |k, v|
      v.each do |cell|
        cell_ping
      end
    end
  end

  def cell_ping
    @grid
  end
end

grid = Grid.new(3)
grid.create_grid
binding.pry