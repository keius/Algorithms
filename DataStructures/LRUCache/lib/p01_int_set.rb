class MaxIntSet
  def initialize(max)
    @max = max
    @store = Array.new(@max, false)
  end

  def insert(num)
    validate!(num)
    @store[num] = true
  end

  def remove(num)
    validate!(num)
    @store[num] = false
  end

  def include?(num)
    !!@store[num]
  end

  private

  def is_valid?(num)
    num.between?(0, @max)
  end

  def validate!(num)
    raise "Out of bounds" unless is_valid?(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)

  end

  def insert(num)
  end

  def remove(num)
  end

  def include?(num)
  end

  private

  def [](num)
  end

  def num_buckets
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
  end

  def insert(num)
  end

  def remove(num)
  end

  def include?(num)
  end

  private

  def [](num)

  end

  def num_buckets
  end

  def resize!
  end
end
