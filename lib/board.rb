class Board
  attr_reader :players, :size
  def initialize
    @players = []
    @size = 100
  end

  def add_player_to_board(player)
    @players.push(player)
  end

  def check_for_snake(location)
    2
  end
end
