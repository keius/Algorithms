require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @count = 0
    @store = Array.new(num_buckets) {Array.new}
  end

  def insert(key)
    resize! if @count == num_buckets
    self[key.hash] << key
    @count += 1
  end

  def include?(key)
    self[key.hash].include?(key)
  end

  def remove(key)
    self[key.hash].delete(key)
    @count -= 1
  end

  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store.flatten
    @store = Array.new(num_buckets * 2) {Array.new}
    @count = 0
    old_store.each do |num|
      insert(num)
    end
  end
end
