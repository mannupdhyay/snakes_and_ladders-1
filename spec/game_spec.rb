require 'spec_helper'
require 'game'

describe Game do
  let(:player_1) { double('player_1') }
  let(:player_2) { double('player_2') }
  let(:board) { double('board', size: 100) }
  let(:die) { double('die', roll: 3) }

  subject(:game) { described_class.new(board, die) }

  context 'Creation of game' do
    context 'Create game' do
      it 'A game can be started' do
        expect(game).to be_an_instance_of Game
      end

      it 'A game can have one player' do
        game.add_player(player_1)
        expect(game.players).to include(player_1)
      end

      it 'A game can have two players' do
        game.add_player(player_1)
        game.add_player(player_2)
        expect(game.players).to include(player_1)
        expect(game.players).to include(player_2)
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
        allow(player_1).to receive(:place_at_start).with(board)
        game.add_player(player_1)
        game.start_game(player_1, board)
        expect(player_1).to have_received(:place_at_start).with(board)
      end
    end
    context 'Die' do
      it "Die is sent 'roll'" do
        allow(die).to receive(:roll).and_return(3)
        allow(player_1).to receive(:move_player).with(3)
        game.roll_die(player_1)
        expect(game.die).to have_received(:roll)
      end
    end
    context 'Moves' do
      it "A player recives a die's roll" do
        game.add_player(player_1)
        roll = die.roll
        allow(player_1).to receive(:place_at_start).with(board)
        allow(player_1).to receive(:move_player).with(roll)
        game.start_game(player_1, board)
        game.roll_die(player_1)
        expect(player_1).to have_received(:move_player).with(roll)
      end
    end
  end
end
