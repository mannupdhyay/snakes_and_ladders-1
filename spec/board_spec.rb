require 'spec_helper'
require 'board'

describe Board do
  let(:player) {double('player') }
  subject(:board) { described_class.new(player) }

  context 'Board' do
    it 'A board can be created' do
      expect(board).to be_an_instance_of Board
    end

    it 'A board can contain a player' do
      expect(board.player).to eq player
    end
  end

end
