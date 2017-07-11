class Pawn < Piece

  def moves
    total_moves = []
    x,y = pos
    if self.color == 'white'
      home = 1
      dir = 1
    else
      home = 6
      dir = -1
    end

    if @board.empty?([x + dir, y])
      total_moves << [ x + dir, y ]
      if pos[0] == home && @board.empty?([x + dir * 2, y])
        total_moves << [ x + dir * 2, y ]
      end
    end

    diagonals = [[ x + dir, y + 1],[x + dir, y - 1]]
    total_moves += diagonals.select do |cap_pos|
      next unless cap_pos[1].between?(0,7)
      !@board.empty?(cap_pos) && @board[cap_pos].color != self.color
    end

  end

  def to_s
    "Pawn"
  end
end
