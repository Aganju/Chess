class Piece
  attr_reader :color :pos
  def initialize(pos, color, board)
    @pos = pos
    @color = color
    @board = board
  end

  def moves
    []
  end
end


class Rook
end

class Bishop
end

class Queen
end
