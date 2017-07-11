require 'byebug'
module SteppingPiece
  def moves
    all_moves =[]
    x, y = pos
   self.class::MOVEDIFFS.each do |move|
      d_x, d_y = move
      poss_move = [x + d_x, y + d_y]
      
      next unless @board.in_bounds(poss_move[0], poss_move[1])
      all_moves << poss_move unless @board[poss_move].color == self.color
    end
    all_moves
 end
end
