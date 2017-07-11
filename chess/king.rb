require_relative 'stepping_piece'

class King < Piece
  MOVEDIFFS = [
    [ 1, 1],
    [-1, 1],
    [ 1,-1],
    [-1,-1],
    [ 0, 1],
    [ 1, 0],
    [ 0,-1],
    [-1, 0]
  ]
  
  include SteppingPiece

  def to_s
    "King"
  end

end
