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
    roll_over_message = 'player stays put as they rolled to many'
    winning_message = 'player wins'
    raise roll_over_message if check_roll_over?(board, roll)
    @location += roll
    raise winning_message if check_player_win?(board)
    @location = board.check_for_transfer(@location)
  end

  private

  def check_roll_over?(board, roll)
    (@location + roll) > board.size
  end

  def check_player_win?(board)
    @location == board.size
  end
end
