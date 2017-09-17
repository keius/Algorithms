class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @prc = prc || Proc.new { |x, y| x <=> y }
    @store = []
  end

  def count
    @store.length
  end

  def extract
    @store[0], @store[count - 1] = @store[count - 1], @store[0]
    popped = @store.pop
    self.class.heapify_down(@store, 0, &prc)
    popped
  end

  def peek
    @store[0]
  end

  def push(val)
    @store << val
    self.class.heapify_up(@store, count - 1, @prc)
  end

  public
  def self.child_indices(len, parent_index)
    [parent_index * 2 + 1, parent_index * 2 + 2].select {|i| i < len}
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0
    (child_index - 1)/2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)

    prc ||= Proc.new { |x, y| x <=> y }

    children = self.child_indices(len, parent_idx)
    left = children[0]
    right = children[1]

    ## if parent has two children, pick smallest, otherwise, the first is the smallest
    if left && right
      small = prc.call(array[left], array[right]) == -1 ? left : right
    else
      small = left
    end

    ## stops if parent is smaller than smaller child (or vice versa), or it's at the end (no children)
    return array if small.nil?
    return array if prc.call(array[parent_idx], array[small]) == -1


    ## swaps with smaller child
    array[parent_idx], array[small] = array[small], array[parent_idx]

    ## goes down a level
    self.heapify_down(array, small, len, &prc)
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    prc ||= Proc.new { |x, y| x <=> y }

    return array if child_idx == 0

    parent = self.parent_index(child_idx)

    ## stops if child is bigger than parent
    return array if prc.call(array[parent], array[child_idx]) == -1

    ## swaps with parent
    array[parent], array[child_idx] = array[child_idx], array[parent]

    ## goes up a level
    self.heapify_up(array, parent, len, &prc)
  end
end
