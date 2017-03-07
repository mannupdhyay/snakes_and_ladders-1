require 'spec_helper'
require 'board'

describe Board do
  context 'Board' do
    let(:player) { double('player') }

    subject(:board) { described_class.new }

    it 'A board can be created' do
      expect(board).to be_an_instance_of Board
    end

    it 'A board can contain a player' do
      board.add_player_to_board(player)
      expect(board.players).to include(player)
    end

    it 'A board has a size of 100' do
      expect(board.size).to eq 100
    end

    it 'A board can contain Snake starting at square 17 that returns 7' do
      expect(board.check_for_transfer(17)).to eq 7
    end

    it "A board doesn't a contain Snake starting at square 11" do
      expect(board.check_for_transfer(11)).to eq 11
    end

    it 'A board can contain Ladder starting at square 4 that returns 14' do
      expect(board.check_for_transfer(4)).to eq 14
    end

    it "A board doesn't a contain Ladder starting at square 13" do
      expect(board.check_for_transfer(13)).to eq 13
    end
  end
end
