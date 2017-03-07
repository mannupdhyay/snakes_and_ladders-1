class Board
  attr_reader :players, :size
  def initialize
    @players = []
    @size = 100
    @transfers = { 12 => 2, 5 => 17 }
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
