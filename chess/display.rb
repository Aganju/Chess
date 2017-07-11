require_relative 'cursor.rb'

PIECE_CHAR = {
  'King' => '[K]',
  'Queen' => '[Q]',
  'Rook' => '[R]',
  'Bishop' => '[B]',
  'Knight' => '[H]',
  'Pawn' => '[P]',
  'space' => '[ ]'
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
    # debugger
    moves = @board[@cursor.cursor_pos].moves
    8.times do |row|
      8.times do |col|
        color = :light_red if moves.include?([row, col])
        color = :red if @cursor.cursor_pos == [row,col]
        print PIECE_CHAR[@board[[row, col]].to_s].colorize(color)
        color = :green
      end
      puts
    end
  end
end

load 'board.rb'
d = Display.new(Board.new, [0,3])
