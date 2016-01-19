class PieceHandler
  def initialize(type, position)
    @type = type
    @y = position[:y]
    @x = position[:x]
  end

  def can_move?(finish)
    MoveValidator.new({x: @x, y: @y}, finish, @type).validate
  end
end