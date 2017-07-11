require_relative 'sliding_piece'

class Rook < Piece
  include SlidingPiece
  def initialize(pos, color, board)
    @directions = "straights"
    super
  end

  def to_s
    "Rook"
  end
end
