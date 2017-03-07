class Player
  attr_accessor :location

  def initialize
    @location = nil
  end

  def place_at_start(board)
    board.add_player_to_board(self)
    @location = 0
  end

  def move_player(board, roll)
    @location += roll
    @location = board.check_for_snake(@location)
  end
end
