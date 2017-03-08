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
  context 'Gameplay' do
    let(:board) { double('board', size: 100) }
    let(:die) { double('die', roll: 3) }
    context 'Moves' do
      it 'A new player is placed on the board at grid position 1' do
        allow(board).to receive(:add_player_to_board).with(player)
        player.place_at_start(board)
        expect(player.location).to eq 0
      end
      it 'A player is moved 3 spaces when the dice is rolled' do
        allow(board).to receive(:add_player_to_board).with(player)
        allow(board).to receive(:check_for_transfer).and_return(3)
        player.place_at_start(board)
        player.move_player(board, die.roll)
        expect(player.location).to eq 3
      end
    end
    context 'Final moves' do
      it 'A player wins if they roll 3 when 3 squares remaining' do
        allow(board).to receive(:add_player_to_board).with(player)
        allow(board).to receive(:check_for_transfer).and_return(97)
        player.place_at_start(board)
        player.move_player(board, 97)
        expect { player.move_player(board, die.roll) }.to raise_error('player wins')
      end
      it 'A player stays on their square if they roll over the remaing squares' do
        allow(board).to receive(:add_player_to_board).with(player)
        allow(board).to receive(:check_for_transfer).and_return(98)
        player.place_at_start(board)
        player.move_player(board, 98)
        message = 'player stays put as they rolled to many'
        expect { player.move_player(board, die.roll) }.to raise_error(message)
        expect(player.location).to eq 98
      end
    end
    context 'Snakes' do
      it 'A player goes to 7 if they land on head of snake at 17' do
        allow(board).to receive(:add_player_to_board).with(player)
        allow(board).to receive(:check_for_transfer).and_return(7)
        player.place_at_start(board)
        player.move_player(board, 17)
        expect(player.location).to eq 7
      end
      it 'A player stays on square if landing on tail of snake' do
        allow(board).to receive(:add_player_to_board).with(player)
        allow(board).to receive(:check_for_transfer).and_return(7)
        player.place_at_start(board)
        player.move_player(board, 7)
        expect(player.location).to eq 7
      end
    end
    context 'Ladders' do
      it 'A player goes to 14 if they land at bottom of a ladder at 4' do
        allow(board).to receive(:add_player_to_board).with(player)
        allow(board).to receive(:check_for_transfer).and_return(14)
        player.place_at_start(board)
        player.move_player(board, 4)
        expect(player.location).to eq 14
      end
      it 'A player stays on square if landing on top of ladder' do
        allow(board).to receive(:add_player_to_board).with(player)
        allow(board).to receive(:check_for_transfer).and_return(14)
        player.place_at_start(board)
        player.move_player(board, 14)
        expect(player.location).to eq 14
      end
    end
  end
end
