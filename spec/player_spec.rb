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
end
