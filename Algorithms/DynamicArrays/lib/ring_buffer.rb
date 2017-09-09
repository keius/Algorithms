require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    @length = 0
    @capacity = 8
    @start_idx = 0
    @end_index = @start_idx + @length
    @store = StaticArray.new(@capacity)
  end

  # O(1)
  def [](index)
    check_index(index)
    @store[(index + @start_idx) % @capacity]
  end

  # O(1)
  def []=(index, val)
    check_index(index)
    @store[(index + @start_idx) % @capacity] = val
  end

  # O(1)
  def pop
    raise "index out of bounds" if @length == 0
    @length -= 1
  end

  # O(1) ammortized
  def push(val)
    resize! if @capacity == @length
    @store[@end_index % @capacity] = val
    @length += 1
  end

  # O(1)
  def shift
    raise "index out of bounds" if @length == 0
    shifted = @store[@start_idx % @capacity]
    @start_idx += 1
    @length -= 1
    return shifted
  end

  # O(1) ammortized
  def unshift(val)
    resize! if @capacity == @length
    @start_idx -= 1
    @length += 1
    @store[@start_idx % @capacity] = val
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
    print @store[index]
    raise "index out of bounds" if (@length == 0) || ((index < @start_idx) && (index > @end_index - 1))
  end

  def resize!
    @capacity *= 2
    oldStore = @store
    @store = StaticArray.new(@capacity)
    (@start_idx..@end_index).each do |i|
      @store[i] = oldStore[i]
    end
  end
end
