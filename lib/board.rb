class Board
  attr_reader :players, :size
  def initialize
    @players = []
    @size = 100
    @snakes = { 12 => 2 }
    @ladders = { 5 => 17 }
  end

  def add_player_to_board(player)
    @players.push(player)
  end

  def check_for_snake(location)
    if @snakes[location].nil?
      location
    else
      @snakes[location]
    end
  end

  def check_for_ladder(location)
    if @ladders[location].nil?
      location
    else
      @ladders[location]
    end
  end
end
