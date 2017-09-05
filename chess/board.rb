require 'colorize'
require_relative 'pieces'

class InvalidMove < StandardError
  def initialize(msg = "Invalid move, no piece at start or piece at end")
  end
end

class Board


  def initialize
    @grid = Array.new(8) { Array.new(8) { NullPiece.instance } }
  end

  def place_pieces_default
    8.times do |i|
      @grid[1][i] = Pawn.new([1, i], 'white', self)
      @grid[6][i] = Pawn.new([6, i], 'black', self)
    end
    @grid[0][0] = Rook.new([0, 0], 'white', self)
    @grid[0][7] = Rook.new([0, 7], 'white', self)
    @grid[7][0] = Rook.new([7, 0], 'black', self)
    @grid[7][7] = Rook.new([7, 7], 'black', self)

    @grid[0][1] = Knight.new([0, 1], 'white', self)
    @grid[0][6] = Knight.new([0, 6], 'white', self)
    @grid[7][1] = Knight.new([7, 1], 'black', self)
    @grid[7][6] = Knight.new([7, 6], 'black', self)

    @grid[0][2] = Bishop.new([0, 2], 'white', self)
    @grid[0][5] = Bishop.new([0, 5], 'white', self)
    @grid[7][2] = Bishop.new([7, 2], 'black', self)
    @grid[7][5] = Bishop.new([7, 5], 'black', self)

    @grid[0][3] = Queen.new([0, 3], 'white', self)
    @grid[7][3] = Queen.new([7, 3], 'black', self)

    @grid[0][4] = King.new([0, 4], 'white', self)
    @grid[7][4] = King.new([7, 4], 'black', self)

  end

  def dup
    dupped_board = Board.new
    @grid.each_with_index do |row, row_index|
      row.each_with_index do |piece, col_index|
        dupped_board[[row_index, col_index]] = piece.dup unless piece.empty?
      end
    end
    dupped_board
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
    self[pos].empty?
  end

  def in_check?(color)
    king_pos = []

    @grid.each_with_index do |squares, index|
      king_pos[0] = index
      squares.each_with_index do |piece, col|
        king_pos[1] = col
        break if piece.to_s == 'King' && piece.color == color
      end

      break if self[king_pos].to_s == 'King'
    end

    opposing_color = color == 'white' ? 'black' : 'white'

    @grid.any? do |row|
      row.any? { |piece| piece.moves.include?(king_pos) if piece.color == opposing_color }
    end

  end

  def move_piece(start_pos, end_pos)

    raise InvalidMove if self.empty?(start_pos) || !self.empty?(end_pos)
    self[end_pos] = self[start_pos]
    self[end_pos].pos = end_pos
    self[start_pos] = NullPiece.instance
  end

  def in_bounds(x, y)
    x.between?(0, 7) && y.between?(0, 7)
  end

end
