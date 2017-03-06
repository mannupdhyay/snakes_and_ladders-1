require 'spec_helper'
require 'game'

describe Game do
  let(:player) { double('player') }
  let(:board) { double('board') }
  let(:die) { double('die') }

  subject(:game) { described_class.new(player, board, die) }

  context 'Creation of game' do
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

    context 'Die' do
      it 'A game can have a die' do
        expect(game.die).to eq die
      end
    end
  end

  context 'Game-Play' do
    context 'New Game' do
      it "Board is sent 'place_new_player' with player" do
        allow(board).to receive(:place_new_player).with(player)
        game.start_game(player)
        expect(game.board).to have_received(:place_new_player).with(player)
      end
    end
    context 'Die' do
      it "Die is sent 'roll' with player" do
        allow(die).to receive(:roll)
        game.roll_die(player)
        expect(game.die).to have_received(:roll).with(player)
      end
    end
  end
end
