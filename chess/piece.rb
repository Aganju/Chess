class Piece
  attr_accessor :pos
  attr_reader :color 
  def initialize(pos, color, board)
    @pos = pos
    @color = color
    @board = board
  end

  def empty?
    false
  end

  def moves
    []
  end
end
