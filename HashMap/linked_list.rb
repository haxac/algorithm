class LinkedList < Container
  include Enumerable
  require_relative 'node'

  attr_accessor :root

  def append_to_tail(data)
    if empty?
      self.root = Node.new(data)
    else
      node = self.root
      node = node.next while node.next
      node.next = Node.new(data)
    end
    increment
  end

  def append(data)
    node = Node.new(data)
    node.next = self.root
    self.root = node
    increment
  end

  def remove(data)
    return nil if empty?

    if self.root.data == data
      removed_node = self.root
      self.root = self.root.next
      decrement
      return removed_node
    end

    node = self.root
    while node.next && node.next.data != data
      node = node.next
    end

    return nil unless node.next

    removed_node = node.next
    node.next = node.next.next
    decrement
    removed_node
  end

  def each
    node = self.root
    while node
      yield node.data
      node = node.next
    end
  end
end
