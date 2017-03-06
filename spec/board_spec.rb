require 'spec_helper'
require 'board'

describe Board do
  let(:player) { double('player', location: 0, :location= => nil) }
  let(:die) { double('die', roll: 3) }

  subject(:board) { described_class.new(player) }

  context 'Board' do
    it 'A board can be created' do
      expect(board).to be_an_instance_of Board
    end

    it 'A board can contain a player' do
      expect(board.player).to eq player
    end

    it 'A board has a array of 100 squares' do
      expect(board.grid.length).to eq 100
    end

    it 'A new player is placed on the board at grid position 1' do
      allow(player).to receive(:location=).with(0)
      board.place_new_player(player)
      expect(board.grid[0].first).to eq player
    end

    it 'A player is moved 3 spaces when the dice is rolled' do
      allow(player).to receive(:location=).with(0)
      board.place_new_player(player)
      board.move_player(player, die.roll)
      expect(board.grid[0].first).not_to eq player
      expect(board.grid[3].first).to eq player
    end
  end
end
