require 'spec_helper'
require 'die'

describe Die do
  subject(:die) { described_class.new }

  context 'Die' do
    it 'A Die can be created' do
      expect(die).to be_an_instance_of Die
    end

    it 'A Die returns a number between 1-6 when rolled' do
      expect([1, 2, 3, 4, 5, 6]).to include(die.roll)
    end
  end
end
