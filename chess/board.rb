require 'colorize'
require_relative 'piece'

class InvalidMove < StandardError
  def initialize(msg = "Invalid move, no piece at start or piece at end")
  end
end
class Board


  def initialize
    @grid = Array.new(8) { Array.new(8) { Piece.new(nil) } }
    place_pieces
  end

  def place_pieces
    8.times do |i|
      @grid[1][i] = Piece.new("Pawn")
      @grid[6][i] = Piece.new("Pawn")
    end
    @grid[0][0] = Piece.new("Rook", self)
    @grid[0][7] = Piece.new("Rook", self)
    @grid[7][0] = Piece.new("Rook", self)
    @grid[7][7] = Piece.new("Rook", self)

    @grid[0][1] = Piece.new("Knight", self)
    @grid[0][6] = Piece.new("Knight", self)
    @grid[7][1] = Piece.new("Knight", self)
    @grid[7][6] = Piece.new("Knight", self)

    @grid[0][2] = Piece.new("Bishop", self)
    @grid[0][5] = Piece.new("Bishop", self)
    @grid[7][2] = Piece.new("Bishop", self)
    @grid[7][5] = Piece.new("Bishop", self)

    @grid[0][3] = Piece.new("Queen", self)
    @grid[7][3] = Piece.new("Queen", self)

    @grid[0][4] = Piece.new("King", self)
    @grid[7][4] = Piece.new("King", self)

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

  def in_bounds(x, y)
    x.between?(0, 7) && y.between?(0, 7)
  end

end
