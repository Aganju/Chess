class Piece
  attr_reader :type
  def initialize(type)
    @type = type
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
