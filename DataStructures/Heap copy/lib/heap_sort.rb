require_relative "heap"

class Array
  def heap_sort!
    up_len = 1
    until up_len > self.length
      BinaryMinHeap.heapify_up(self, up_len-1, up_len) {|x, y| -1 * (x <=> y)}
      up_len += 1
    end

    down_len = self.length
    until down_len == 0
      down_len -= 1
      self[0], self[down_len] = self[down_len], self[0]
      BinaryMinHeap.heapify_down(self, 0, down_len) {|x, y| -1 * (x <=> y)}
    end

    self
  end
end
