require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all

      expect(peeps).to include("My first peep")
      expect(peeps).to include("My second peep")
    end
  end
end
