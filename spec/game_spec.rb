require 'spec_helper'
require 'game'

describe Game do
  let (:player) { double('player') }
  subject(:game) { described_class.new(player) }

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
end
