class Game
  attr_reader :players, :board, :die, :current_player
  def initialize(board, die)
    @players = []
    @current_player
    @board = board
    @die = die
  end

  def add_player(player)
    @players.push(player)
    choose_first_player
  end

  def start_game(player, board)
    player.place_at_start(board)
  end

  def roll_die(player)
    roll = @die.roll
    player.move_player(roll)
  end

  def choose_first_player
    @players.shuffle!
    @current_player = @players.first
  end

end
