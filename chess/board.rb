require 'colorize'

class InvalidMove < StandardError
  def initialize(msg = "Invalid move, no piece at start or piece at end")
  end
end
class Board


  def initialize
    @grid = Array.new(8) { Array.new(8) }
    place_pieces
  end

  def place_pieces
    8.times do |i|
      @grid[1][i] = Piece.new("Pawn")
      @grid[6][i] = Piece.new("Pawn")
    end
    @grid[0][0] = Piece.new("Castle")
    @grid[0][7] = Piece.new("Castle")
    @grid[7][0] = Piece.new("Castle")
    @grid[7][7] = Piece.new("Castle")

    @grid[0][1] = Piece.new("Knight")
    @grid[0][6] = Piece.new("Knight")
    @grid[7][1] = Piece.new("Knight")
    @grid[7][6] = Piece.new("Knight")

    @grid[0][2] = Piece.new("Bishop")
    @grid[0][5] = Piece.new("Bishop")
    @grid[7][2] = Piece.new("Bishop")
    @grid[7][5] = Piece.new("Bishop")

    @grid[0][3] = Piece.new("Queen")
    @grid[7][3] = Piece.new("Queen")

    @grid[0][4] = Piece.new("King")
    @grid[7][4] = Piece.new("King")
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, piece)
    x, y = pos
    @grid[x][y] = piece
  end

  def empty?(pos)
    self[pos].nil?
  end

  def move_piece(start_pos, end_pos)
    raise InvalidMove if self.empty?(start_pos) || !self.empty?(end_pos)
    self[end_pos] = self[start_pos]
    self[start_pos] = nil
  end

end

class Piece
  def initialize(type)
    @type = type
  end
end
