class KeyValuePair
  attr_accessor :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end

  def ==(other)
    other.is_a?(KeyValuePair) && key == other.key
  end

  def to_s
    "#{key}: #{value}"
  end

  def inspect
    "#<KeyValuePair key=#{key.inspect}, value=#{value.inspect}>"
  end
end
