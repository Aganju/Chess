require_relative 'stepping_piece'

class Knight < Piece
  MOVEDIFFS = [
  [ 1, -2],
  [ 1,  2],
  [-1, -2],
  [-2, -1],
  [ 2, -1],
  [ 2,  1],
  [-2,  1],
  [-1,  2]
  ]
  include SteppingPiece

  def to_s
    "Knight"
  end
end
