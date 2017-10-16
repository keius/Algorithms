class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    @prev.next = @next if @prev
    @next.prev = @prev if @next
    @next, @prev = nil, nil
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    node = first
    i.times do |i|
      node = node.next
    end
    node
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    each do |node|
      return node.val if node.key == key
    end

    nil
  end

  def include?(key)
    get(key) ? true : false
  end

  def append(key, val)
    new_node = Node.new(key, val)
    last_node = last
    last_node.next = new_node
    new_node.prev = last_node
    new_node.next = @tail
    @tail.prev = new_node

    new_node
  end

  def update(key, val)
    each do |node|
      if node.key == key
        node.val = val
        break
      end
    end
    nil
  end

  def remove(key)
    each do |node|
      if node.key == key
        node.remove
        return node
      end
    end
    nil
  end

  def each
    node = first
    until node == @tail
      yield(node)
      node = node.next
    end
  end

  def to_s
    inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  end

end
