require 'peep'
require 'database_helpers'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      add_test_data

      peeps = Peep.all

      expect(peeps.length).to eq(2)
      expect(peeps.first).to be_a Peep
      expect(peeps.first.username).to eq('Charly')
      expect(peeps.first.content).to eq('My first peep')
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(username: 'TestUsername', name: 'Test Person', content: 'Testing writing a peep', time: '12:06:00', date: '2020-02-18')

      persisted_data = persisted_data(id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.username).to eq('TestUsername')
      expect(peep.content).to eq('Testing writing a peep')
    end
  end
end

# need to write a test for peep that checks that the user that created the peep is correct
