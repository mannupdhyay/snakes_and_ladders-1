require 'spec_helper'
require 'game'

describe Game do
  let(:player) { double('player') }
  let(:board) { double('board', size: 100) }
  let(:die) { double('die', roll: 3) }

  subject(:game) { described_class.new(player, board, die) }

  context 'Creation of game' do
    context 'Create game' do
      it 'A game can be started' do
        expect(game).to be_an_instance_of Game
      end

      it 'A game can have a player' do
        expect(game.player).to eq player
      end

      it 'A game can have a board' do
        expect(game.board).to eq board
      end

      it 'A game can have a die' do
        expect(game.die).to eq die
      end
    end
  end

  context 'Game-Play' do
    context 'New Game' do
      it "player is sent 'place_at_start'" do
        allow(player).to receive(:place_at_start).with(board)
        game.start_game(player, board)
        expect(game.player).to have_received(:place_at_start).with(board)
      end
    end
    context 'Die' do
      it "Die is sent 'roll'" do
        allow(die).to receive(:roll).and_return(3)
        allow(player).to receive(:move_player).with(3)
        game.roll_die(player)
        expect(game.die).to have_received(:roll)
      end
    end
    context 'Moves' do
      it "A player recives a die's roll" do
        roll = die.roll
        allow(player).to receive(:place_at_start).with(board)
        allow(player).to receive(:move_player).with(roll)
        game.start_game(player, board)
        game.roll_die(player)
        expect(game.player).to have_received(:move_player).with(roll)
      end
    end
  end
end
