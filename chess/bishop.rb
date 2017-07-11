require_relative 'sliding_piece'
class Bishop < Piece
  include SlidingPiece
  def initialize(pos, color, board)
    @directions = "diagonals"
    super
  end

  def to_s
    "Bishop"
  end
end
