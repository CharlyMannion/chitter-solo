require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      add_test_data
      
      peeps = Peep.all

      expect(peeps).to include("My first peep")
      expect(peeps).to include("Peep")
    end
  end
end
