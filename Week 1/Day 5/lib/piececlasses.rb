class Piece
  def initialize(name)
    @name = name
    @behaviour = {
     :horizontal_vertical_axes = ['Infinity', '-Infinity', '0.0', '-0.0']
     :diagonal_axes = ['1.0', '-1.0']
     :all_axes = ['Infinity', '-Infinity', '0.0', '-0.0', '1.0', '-1.0']
     :wPawn = ['Infinity']
     :bPawn = ['-Infinity']
    }
  end

  def calculate_gradient(start, finish, accepted_values)
    formula = gradient_formula(start, finish)
    accepted_values.include?(formula.call.to_s)
  end

  def calculate_proximity(start, finish, accepted_values)
    formula = proximity_formula(start, finish)
    accepted_values.include?(formula.call)
  end

  private

  def gradient_formula(start, finish)
    proc do
      (finish[:y] - start[:y]) / (finish[:x].to_s.ord - start[:x].to_s.ord.to_f)
    end
  end

  def proximity_formula(start, finish)
    proc do
      proximity_x = (finish[:x].to_s.ord - start[:x].to_s.ord).abs
      proximity_y = (finish[:y] - start[:y]).abs
      proximity_x < proximity_y ? true_proximity = proximity_y : true_proximity = proximity_x
      true_proximity
    end
  end
end

class Rook < Piece
  def behaviour(start, finish)
    calculate_gradient(start, finish, @behaviour[:horizontal_vertical_axes])
  end
end

class Bishop < Piece
  def behaviour(start, finish)
    calculate_gradient(start, finish, @behaviour[:diagonal_axes])
  end
end

class Queen < Piece
  def behaviour(start, finish)
    calculate_gradient(start, finish, @behaviour[:all_axes])
  end
end

class King < Piece
  def behaviour(start, finish)
    calculate_proximity(start, finish, [1])
  end
end

class Knight < Piece
  def behaviour(start, finish)
    calculate_proximity(start, finish, [2]) && !calculate_gradient(start, finish, @behaviour[:all_axes])
  end
end

class Pawn < Piece
  def initialize(name, type='black')
    super(name)
    @type = type
    @first_move = true
  end

  def behaviour(start, finish)
    @first_move ? reach = [1, 2] : reach = [1]
    if @type == 'white'
      calculate_gradient(start, finish, @behaviour[:wPawn]) && calculate_proximity(start, finish, reach)
    else
      calculate_gradient(start, finish, @behaviour[:bPawn]) && calculate_proximity(start, finish, reach)
    end      
  end
end
