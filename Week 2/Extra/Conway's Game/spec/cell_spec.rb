require '../cell'

describe Cell do 

  describe '#regenerate' do
    it "regenerates a dead cell from a dead cell if it has 0 neighbours" do
      cell = Cell.new(0, [0,0,0,0,0,0,0,0])
      cell.regenerate
      expect(cell.alive?).to eq(0)
    end

    it "regenerates a dead cell from a live cell if it has 0 neighbours" do
      cell = Cell.new(1, [0,0,0,0,0,0,0,0])
      cell.regenerate
      expect(cell.alive?).to eq(0)
    end

    it "regenerates a dead cell from a dead cell if it has 1 neighbour" do
      cell = Cell.new(0, [0,0,0,0,0,0,0,1])
      cell.regenerate
      expect(cell.alive?).to eq(0)
    end

    it "regenerates a dead cell from a live cell if it has 1 neighbour" do
      cell = Cell.new(1, [0,0,0,0,0,0,0,1])
      cell.regenerate
      expect(cell.alive?).to eq(0)
    end

    it "regenerates a live cell from a live cell if it has 2 neighbours" do
      cell = Cell.new(1, [0,0,0,0,0,0,1,1])
      cell.regenerate
      expect(cell.alive?).to eq(1)
    end

    it "regenerates a live cell from a live cell if it has 3 neighbours" do
      cell = Cell.new(1, [0,0,0,0,0,1,1,1])
      cell.regenerate
      expect(cell.alive?).to eq(1)
    end

    it "regenerates a live cell from a dead cell if it has 3 neighbours" do
      cell = Cell.new(0, [0,0,0,0,0,1,1,1])
      cell.regenerate
      expect(cell.alive?).to eq(1)
    end

    it "regenerates a dead cell from a live cell if it has 4 neighbours" do
      cell = Cell.new(1, [0,0,0,0,1,1,1,1])
      cell.regenerate
      expect(cell.alive?).to eq(0)
    end
  end
end

# Any live cell with fewer than two live neighbours dies, as if caused by under-population.
# Any live cell with two or three live neighbours lives on to the next generation.
# Any live cell with more than three live neighbours dies, as if by overcrowding.
# Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
