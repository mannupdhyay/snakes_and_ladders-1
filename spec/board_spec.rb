require 'spec_helper'
require 'board'

describe Board do
  let(:player) { double('player') }
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
      board.place_new_player(player)
      expect(board.grid[0].first).to eq player
    end
  end
end
