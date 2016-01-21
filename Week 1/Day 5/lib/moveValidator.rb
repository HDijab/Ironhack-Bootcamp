class MoveValidator
  def initialize(start, finish, type)
    @start = start
    @finish = finish
    @type = type
  end

  def validate
    @type.behaviour(@start, @finish)
  end
end
