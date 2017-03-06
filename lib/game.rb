class Game
  attr_reader :player, :board
  def initialize(player, board)
    @player = player
    @board = board
  end

  def start_game(player)
    @board.place_new_player(player)
  end
end
