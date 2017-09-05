module SlidingPiece

  DIAGONALS = [
    [1, 1],
    [-1, 1],
    [1, -1],
    [-1, -1]
  ]

  STRAIGHTS = [
    [0, 1],
    [1, 0],
    [0, -1],
    [-1, 0]
  ]

  def moves
    all_moves = []
    case @directions
    when "diagonals"
      DIAGONALS.each { |dir| all_moves += moves_in_dir(dir) }
    when "straights"
      STRAIGHTS.each { |dir| all_moves += moves_in_dir(dir) }
    when "both"
      (DIAGONALS + STRAIGHTS).each { |dir| all_moves += moves_in_dir(dir) }
    end
    all_moves
  end

  private

  def moves_in_dir(dir)
    d_x, d_y = dir
    x, y = pos
    x += d_x
    y += d_y
    dir_moves = []
    while @board.in_bounds(x, y) && @board[[x, y]].empty?
      dir_moves << [x, y]
      x += d_x
      y += d_y
    end
    return dir_moves unless @board.in_bounds(x, y)
    dir_moves << [x, y] unless self.color == @board[[x, y]].color
    dir_moves
  end

end
