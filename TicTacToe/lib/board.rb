class Board
  attr_reader :grid

  def initialize(grid = Array.new(3) {Array.new(3)})
    @grid = grid
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    @grid[x][y] = value
  end

  def place_mark(pos, mark)
    self[pos] = mark
  end

  def empty?(pos)
    self[pos].nil?
  end

  def over?
    @grid.flatten.none?(&:nil?) || winner
  end

  def winner
    (@grid + col + diag).each do |triple|
      return :X if triple == [:X, :X, :X]
      return :O if triple == [:O, :O, :O]
    end
    return nil
  end

  private
  def col
    cols = Array.new(3) {Array.new(3)}
    (0..2).each do |row|
      (0..2).each do |col|
        cols[col][row] = @grid[row][col]
      end
    end
    cols
  end

  def diag
    diags = [[[0,0],[1,1],[2,2]],[[2,0],[1,1],[0,2]]]
    diags.map do |triple|
      triple.map do |pos|
        self[pos]
      end
    end
  end
end
