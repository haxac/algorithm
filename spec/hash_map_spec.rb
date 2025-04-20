require 'digest'
require_relative '../HashMap/hash_map'

RSpec.describe HashMap do
  let(:hash_map) { HashMap.new }

  describe '#put' do
    it 'stores a key-value pair' do
      pair = hash_map.put('name', 'Alice')
      expect(pair.key).to eq('name')
      expect(pair.value).to eq('Alice')
    end

    it 'overwrites value for the same key' do
      hash_map.put('name', 'Alice')
      pair = hash_map.put('name', 'Bob')
      expect(pair.key).to eq('name')
      expect(pair.value).to eq('Bob')
    end
  end

  describe '#get' do
    it 'retrieves a value by its key' do
      hash_map.put('name', 'Alice')
      expect(hash_map.get('name')).to eq('Alice')
    end

    it 'returns nil for a nonexistent key' do
      expect(hash_map.get('nonexistent')).to be_nil
    end
  end
end
