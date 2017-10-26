class HumanPlayer
  attr_reader :name, :board
  attr_accessor :mark

  def initialize(name)
    @name = name
  end

  def display(board)
    board.grid.each do |row|
      puts row.to_s
    end
  end

  def get_move
    puts "Where to put mark?"
    pos = gets.chomp.split(",").map(&:to_i)
  end
end
