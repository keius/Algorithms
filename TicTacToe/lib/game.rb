require_relative 'board'
require_relative 'computer_player'
require_relative 'human_player'

class Game
  attr_reader :board, :player1, :player2, :current_player

  def initialize(board = Board.new, player1, player2)
    @board = board
    @player1 = player1
    @player2 = player2
    @current_player = player1

    @player1.mark = :X
    @player2.mark = :O
  end

  def run
    until over?
      play_turn
    end

    if @board.winner
      puts "#{@board.winner} has won!"
    else
      puts "It's a tie!"
    end
  end

  def play_turn
    @current_player.display(@board)
    unless @board.winner
      pos = @current_player.get_move
      @board.place_mark(pos, @current_player.mark)
      switch_players!
    end
  end

  def over?
    @board.over?
  end

  def switch_players!
    @current_player = @current_player == @player1 ? @player2 : @player1
  end
end

puts "What is your name?"
player1 = HumanPlayer.new(gets.chomp)
Game.new(player1, ComputerPlayer.new('garry')).run
