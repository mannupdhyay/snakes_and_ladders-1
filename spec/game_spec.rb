require 'spec_helper'
require 'game'

describe Game do
  let(:player) { double('player') }
  let(:board) { double('board') }
  subject(:game) { described_class.new(player, board) }

  context 'Create game' do
    it 'A game can be started' do
      expect(game).to be_an_instance_of Game
    end
  end

  context 'Player' do
    it 'A game can have a player' do
      expect(game.player).to eq player
    end
  end

  context 'Board' do
    it 'A game can have a board' do
      expect(game.board).to eq board
    end
  end

end
