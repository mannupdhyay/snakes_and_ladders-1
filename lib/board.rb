class Board
  attr_reader :player, :grid
  def initialize(player)
    @player = player
    @grid = Array.new(100, [])
  end

  def place_new_player(player)
    player.location = nil
    @grid[0] = [player]
  end

  def move_player(player, roll)
    @grid[player.location].shift
    @grid[(player.location + roll)] = [player]
    player.location += roll
  end
end
