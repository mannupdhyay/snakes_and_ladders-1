class Board
  attr_reader :player, :grid
  def initialize(player)
    @player = player
    @grid = Array.new(100, [])
  end

  def place_new_player(player)
    @grid[0] = [player]
  end
end
