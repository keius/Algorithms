require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @length = 0
    @capacity = 8
    @store = StaticArray.new(@capacity)
  end

  # O(1)
  def [](index)
    check_index(index)
    @store[index]
  end

  # O(1)
  def []=(index, value)
    check_index(index)
    @store[index] = value
  end

  # O(1)
  def pop
    raise "index out of bounds" if @length == 0
    @length -= 1
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    resize! if @capacity == @length
    @store[@length] = val
    @length += 1
  end

  # O(n): has to shift over all the elements.
  def shift
    raise "index out of bounds" if @length == 0
    shifted = @store[0]
    oldStore = @store
    (1..@length - 1).each do |i|
      @store[i-1] = oldStore[i]
    end
    @length -= 1
    return shifted
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    oldStore = @store
    (0..@length-1).each do |i|
      @store[i+1] = oldStore[i]
    end
    @store[0] = val
    @length += 1
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
    raise "index out of bounds" if (index >= @length)
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    @capacity *= 2
    oldStore = @store
    @store = StaticArray.new(@capacity)
    (0..@length - 1).each do |i|
      @store[i] = oldStore[i]
    end
  end
end
