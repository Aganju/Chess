module SlidingPiece

  DIAGONALS = [
    [1,1],
    [-1,1],
    [1,-1],
    [-1,-1]
  ]

  STRAIGHTS = [
    [0,1],
    [1,0],
    [0,-1],
    [-1,0]
  ]

  def moves_in_dir(dir)
    x,y = dir
    x += 1
    y += 1
    moves = []
    while @board[[x,y]].class == NullPiece && @board.in_bounds(x,y)
      moves << [x,y]
      x += 1
      y += 1
    end
    moves << [x,y] unless self.color == @board[[x,y]].color
  end

  def moves(directions)
    all_moves = []
    case directions
    when "diagonal"
      DIAGONALS.each { |dir| all_moves << moves_in_dir(dir) }
    when "straights"
      STRAIGHTS.each { |dir| all_moves << moves_in_dir(dir) }
    when "both"
      all_moves = moves("diagonal") + moves("straights")
    end
    all_moves
  end
end
