class Game
  attr_reader :players, :board, :die
  def initialize(board, die)
    @players = []
    @current_player
    @board = board
    @die = die
  end

  def add_player(player)
    @players.push(player)
    @current_player = @players.first
  end

  def start_game(player, board)
    player.place_at_start(board)
  end

  def roll_die(player)
    roll = @die.roll
    player.move_player(roll)
  end
end
