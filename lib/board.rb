class Board
  attr_reader :player, :grid
  def initialize(player)
    @player = player
    @grid = Array.new(100, [])
  end
end
