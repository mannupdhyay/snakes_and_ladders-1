require 'spec_helper'
require 'board'

describe Board do
  subject(:board) { described_class.new }

  context 'Board' do
    it 'A board can be created' do
      expect(board).to be_an_instance_of Board
    end
  end
end
