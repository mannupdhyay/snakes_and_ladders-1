class Game
  attr_reader :players, :board, :die, :current_player
  def initialize(board, die)
    @players = []
    @current_player = nil
    @board = board
    @die = die
  end

  def add_player(player)
    @players.push(player)
    choose_first_player
  end

  def start_game(board)
    put_players_on_board(board)
  end

  def roll_die(player)
    roll = @die.roll
    player.move_player(roll)
    next_player
  end

  private

  def choose_first_player
    @players.shuffle!
    @current_player = @players.first
  end

  def put_players_on_board(board)
    @players.each do |player|
      player.place_at_start(board)
    end
  end

  def next_player
    @current_player = @players.rotate!.first
  end
end
