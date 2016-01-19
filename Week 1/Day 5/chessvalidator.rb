_board = {
  8 => { a: nil, b: nil, c: nil, d: nil, e: nil, f: nil, g: nil, h: nil },
  7 => { a: nil, b: nil, c: nil, d: nil, e: nil, f: nil, g: nil, h: nil },
  6 => { a: nil, b: nil, c: nil, d: nil, e: nil, f: nil, g: nil, h: nil },
  5 => { a: nil, b: nil, c: nil, d: nil, e: nil, f: nil, g: nil, h: nil },
  4 => { a: nil, b: nil, c: nil, d: nil, e: nil, f: nil, g: nil, h: nil },
  3 => { a: nil, b: nil, c: nil, d: nil, e: nil, f: nil, g: nil, h: nil },
  2 => { a: nil, b: nil, c: nil, d: nil, e: nil, f: nil, g: nil, h: nil },
  1 => { a: nil, b: nil, c: nil, d: nil, e: nil, f: nil, g: nil, h: nil }
}

APP_ROOT = File.dirname(__FILE__)

$LOAD_PATH << File.join(APP_ROOT, 'lib')

require 'pry'
require 'pieceHandler'
require 'moveValidator'
require 'pieceClasses'
require 'chessBoard'

# PAWN TEST ##########################################
# pawn = PieceHandler.new(Pawn.new('wP'), {x: :a, y: 2})
# puts pawn.can_move?({x: :a, y: 3}) # true
# puts pawn.can_move?({x: :a, y: 4}) # true
# puts pawn.can_move?({x: :a, y: 5}) # false
# puts pawn.can_move?({x: :b, y: 4}) # false
# puts pawn.can_move?({x: :a, y: 1}) # false
# puts pawn.can_move?({x: :b, y: 1}) # false
# puts pawn.can_move?({x: :b, y: 2}) # false
# puts pawn.can_move?({x: :b, y: 3}) # false
# puts
# ROOK TEST ##########################################
# rook = PieceHandler.new(Rook.new('wR'), {x: :a, y: 1})
# puts rook.can_move?({x: :b, y: 1}) # true
# puts rook.can_move?({x: :a, y: 2}) # true
# puts rook.can_move?({x: :h, y: 1}) # true
# puts rook.can_move?({x: :a, y: 8}) # true
# puts rook.can_move?({x: :b, y: 2}) # false
# puts rook.can_move?({x: :h, y: 8}) # false
# puts
# BISHOP TEST ########################################
# bishop = PieceHandler.new(Bishop.new('wB'), {x: :b, y: 1})
# puts bishop.can_move?({x: :a, y: 2}) # true
# puts bishop.can_move?({x: :c, y: 2}) # true
# puts bishop.can_move?({x: :a, y: 1}) # false
# puts bishop.can_move?({x: :c, y: 1}) # false
# puts bishop.can_move?({x: :b, y: 2}) # false
# puts
# KNIGHT TEST ########################################
# knight = PieceHandler.new(Knight.new('wN'), {x: :c, y: 1})
# puts knight.can_move?({x: :b, y: 3}) # true
# puts knight.can_move?({x: :d, y: 3}) # true
# puts knight.can_move?({x: :c, y: 3}) # false
# puts knight.can_move?({x: :b, y: 2}) # false
# puts knight.can_move?({x: :c, y: 2}) # false
# puts knight.can_move?({x: :d, y: 2}) # false
# puts knight.can_move?({x: :b, y: 1}) # false
# puts knight.can_move?({x: :d, y: 1}) # false
# puts
# QUEEN TEST #########################################
# queen = PieceHandler.new(Queen.new('wQ'), {x: :d, y: 1})
# puts queen.can_move?({x: :c, y: 1}) # true
# puts queen.can_move?({x: :c, y: 2}) # true
# puts queen.can_move?({x: :d, y: 2}) # true
# puts queen.can_move?({x: :e, y: 2}) # true
# puts queen.can_move?({x: :e, y: 1}) # true
# puts queen.can_move?({x: :c, y: 3}) # false
# puts queen.can_move?({x: :e, y: 3}) # false
# puts
# KING TEST ##########################################
# king = PieceHandler.new(King.new('wK'), {x: :e, y: 1})
# puts king.can_move?({x: :d, y: 1}) # true
# puts king.can_move?({x: :d, y: 2}) # true
# puts king.can_move?({x: :e, y: 2}) # true
# puts king.can_move?({x: :f, y: 2}) # true
# puts king.can_move?({x: :f, y: 1}) # true
# puts king.can_move?({x: :c, y: 1}) # false
# puts king.can_move?({x: :c, y: 2}) # false
# puts king.can_move?({x: :c, y: 3}) # false
# puts king.can_move?({x: :d, y: 3}) # false
# puts king.can_move?({x: :e, y: 3}) # false
# puts king.can_move?({x: :f, y: 3}) # false
# puts king.can_move?({x: :g, y: 3}) # false
# puts king.can_move?({x: :g, y: 1}) # false
# puts king.can_move?({x: :g, y: 2}) # false
