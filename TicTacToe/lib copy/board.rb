class Board
  attr_reader :grid

  def initialize(grid = Array.new(3) { Array.new(3) })
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

  def winner
    (@grid + diagonals + columns).each do |triple|
      return :X if triple == [:X, :X, :X]
      return :O if triple == [:O, :O, :O]
    end

    nil
  end

  def over?
    winner || @grid.flatten.none?(&:nil?)
  end

  def diagonals
    dia1 = [[0,0],[1,1],[2,2]]
    dia2 = [[2,0],[1,1],[0,2]]

    [dia1.map{|pos1| self[pos1]}, dia2.map{|pos2| self[pos2]}]
  end

  def columns
    columns = Array.new(3) {Array.new}
    @grid.each do |row|
      (0..2).each do |col|
        columns[col] << row[col]
      end
    end
    columns
  end
end
