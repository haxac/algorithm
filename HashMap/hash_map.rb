class HashMap
  include Digest
  require_relative 'container'
  require_relative 'linked_list'
  require_relative 'key_value_pair'

  attr_accessor :table
  TABLE_SIZE = 512

  def initialize(table_size = TABLE_SIZE)
    @table_size = table_size
    @table = Array.new(@table_size) {LinkedList.new}
  end

  def put(key, value)
    index = hash_key(key)
    list = @table[index]
    new_pair = KeyValuePair.new(key, value)

    list.each do |pair|
      if pair == new_pair
        pair.value = value
        return pair
      end
    end

    list.append(new_pair)
    new_pair
  end

  def get(key)
    index = hash_key(key)
    list = @table[index]

    list.each do |pair|
      return pair.value if key == pair.key
    end

    nil
  end

  def hash_key(key)
    Digest::SHA256.hexdigest(key).to_i(16) % @table_size
  end
end
