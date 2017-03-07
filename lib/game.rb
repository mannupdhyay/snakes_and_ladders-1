class Game
  attr_reader :player, :board, :die
  def initialize(player, board, die)
    @player = player
    @board = board
    @die = die
  end

  def start_game(player, board)
    player.place_at_start(board)
  end

  def roll_die(player)
    roll = @die.roll
    player.move_player(roll)
  end
end
