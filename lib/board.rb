class Board
  attr_reader :players, :size
  def initialize
    @players = []
    @size = 100
    @transfers = {
      4 => 14, 9 => 31, 17 => 7, 20 => 38,
      28 => 84, 40 => 59, 51 => 67, 54 => 34,
      62 => 19, 63 => 81, 64 => 60, 71 => 91,
      87 => 24, 93 => 73, 95 => 75, 99 => 78
    }
  end

  def add_player_to_board(player)
    @players.push(player)
  end

  def check_for_transfer(location)
    if @transfers[location].nil?
      location
    else
      @transfers[location]
    end
  end
end
