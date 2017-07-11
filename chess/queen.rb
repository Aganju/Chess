require_relative 'sliding_piece'
class Queen < Piece
  include SlidingPiece
  def initialize(pos, color, board)
    @directions = "both"
    super
  end

  def to_s
    "Queen"
  end
end
