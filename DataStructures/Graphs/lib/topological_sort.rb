require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  sorted = []
  queue = []

  vertices.each {|vertex| queue << vertex if vertex.in_edges.empty?}

  until queue.empty?
    current = queue.shift
    sorted << current

    edges = current.out_edges

    until edges.empty?
      next_edge = edges.shift
      next_vertex = next_edge.to_vertex
      next_edge.destroy!
      queue << next_vertex if next_vertex.in_edges.empty?
    end
  end

  vertices.all? {|vertex| vertex.in_edges.empty? && vertex.out_edges.empty?} ? sorted : []
end
