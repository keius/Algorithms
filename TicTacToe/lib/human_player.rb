class HumanPlayer
  attr_reader :name, :board
  attr_accessor :mark

  def initialize(name)
    @name = name
  end

  def display(board)
    puts board.grid.to_s
  end

  def get_move
    puts "Where to place mark?"
    gets.chomp.split(",").map(&:to_i)
  end
end
