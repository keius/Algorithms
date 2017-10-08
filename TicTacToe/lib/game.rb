require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
  attr_reader :board, :current_player, :player1, :player2

  def initialize(player1, player2)
    @board = Board.new
    @player1, @player2 = player1, player2
    @current_player = player1
  end

  def run
    until @board.over?
      play_turn
    end

    player1.display(@board)
    puts "Game over!"
  end

  def play_turn
    current_player.display(board)
    move = current_player.get_move

    @board.place_mark(move, current_player.mark)
    switch_players!
  end

  def switch_players!
    @current_player = @current_player == @player1 ? @player2 : @player1
  end
end

puts "What's your name?"
player1 = HumanPlayer.new(gets.chomp)
player1.mark = :X

puts "What's your opponent's name?"
player2 = ComputerPlayer.new(gets.chomp)
player2.mark = :O

game = Game.new(player1, player2)
game.run
