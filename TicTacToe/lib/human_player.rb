

class HumanPlayer
  attr_reader :name
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
    puts "Where would you like to place your mark?"
    move = gets.chomp.split(",").map(&:to_i)
    return move
  end
end
