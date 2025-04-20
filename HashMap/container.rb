class Container
  attr_accessor :size

  def initialize
    @size = 0
  end

  def empty?
    @size == 0
  end

  def increment
    self.size+=1
  end

  def decrement
    self.size-=1
  end
end
