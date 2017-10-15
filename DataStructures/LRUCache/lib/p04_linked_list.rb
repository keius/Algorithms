class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)

  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove

  end
end

class LinkedList
  include Enumerable

  def initialize

  end

  def [](i)

  end

  def first
  end

  def last
  end

  def empty?
  end

  def get(key)
  end

  def include?(key)

  end

  def append(key, val)

  end

  def update(key, val)

  end

  def remove(key)

  end

  def each

  end

  def to_s
    inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  end

end
