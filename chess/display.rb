require_relative 'cursor.rb'
require_relative 'board'

PIECE_CHAR = {
  'King' => '[K]',
  'Queen' => '[Q]',
  'Rook' => '[R]',
  'Bishop' => '[B]',
  'Knight' => '[H]',
  'Pawn' => '[P]',
  nil => '[ ]'
}
class Display
  def initialize(board,cursor_pos)
    @board = board
    @cursor = Cursor.new(cursor_pos,board)

  end

  def run
    loop do
      system("clear")
      render
      @cursor.get_input
    end
  end

  def render
    color = :green
    8.times do |row|
      8.times do |col|
        color = :red if @cursor.cursor_pos == [row,col]
        print PIECE_CHAR[@board[[row, col]].type].colorize(color)
        color = :green
      end
      puts
    end
  end
end
