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

  def inspect
    { type: self.to_s, pos: @pos, color: @color }.inspect
  end

  def valid_moves
    self.moves.reject do |move|
      test_board = @board.dup
      test_board.move_piece!(@pos, move)
      test_board.in_check?(@color)
    end
  end

  def moves
    []
  end
end
