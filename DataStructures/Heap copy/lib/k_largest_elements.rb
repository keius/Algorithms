require_relative 'heap'

def k_largest_elements(array, k)
  heap = BinaryMinHeap.new
  array.each do |el|
    heap.push(el)
    heap.extract if heap.count > k
  end
  heap.store
end
