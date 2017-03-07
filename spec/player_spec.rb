require 'spec_helper'
require 'player'

describe Player do
  subject(:player) { described_class.new }

  context 'Details' do
    it 'A player can be created' do
      expect(player).to be_an_instance_of(Player)
    end
    it 'A player has no location' do
      expect(player.location).to eq nil
    end
  end
  context 'Gameplay' do
    let(:board) { double('board') }
    let(:die) { double('die', roll: 3) }
    it 'A new player is placed on the board at grid position 1' do
      allow(board).to receive(:add_player_to_board).with(player)
      player.place_at_start(board)
      expect(player.location).to eq 0
    end
    it 'A player is moved 3 spaces when the dice is rolled' do
      allow(board).to receive(:add_player_to_board).with(player)
      allow(board).to receive(:check_for_snake).with(3).and_return(3)
      player.place_at_start(board)
      player.move_player(board, die.roll)
      expect(player.location).to eq 3
    end
    it 'A player goes to 2 if they land on 12' do
      allow(board).to receive(:add_player_to_board).with(player)
      allow(board).to receive(:check_for_snake).and_return(3, 6, 9, 2)
      player.place_at_start(board)
      4.times do |_i|
        player.move_player(board, die.roll)
      end
      expect(player.location).to eq 2
    end
  end
end
