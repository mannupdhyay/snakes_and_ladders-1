require 'spec_helper'
require 'game'

describe Game do
  let(:player) { double('player') }
  let(:board) { double('board') }
  let(:die) { double('die', roll: 3) }

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
      it "Die is sent 'roll'" do
        allow(die).to receive(:roll).and_return(3)
        allow(board).to receive(:move_player).with(player, 3)
        game.roll_die(player)
        expect(game.die).to have_received(:roll)
      end
    end
    context 'Moves' do
      it "A board recives a player's roll" do
        roll = die.roll
        allow(board).to receive(:place_new_player).with(player)
        allow(board).to receive(:move_player).with(player, roll)
        game.start_game(player)
        game.roll_die(player)
        expect(game.board).to have_received(:move_player).with(player, roll)
      end
    end
  end
end
