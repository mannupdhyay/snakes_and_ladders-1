require "spec_helper"
require "game"

describe Game do
  subject(:game){ described_class.new }

  context 'create game' do
    it 'A game can be started' do
      expect(game).to be_an_instance_of Game
    end
  end
end
