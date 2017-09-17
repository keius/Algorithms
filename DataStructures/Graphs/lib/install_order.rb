# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to

require_relative 'graph'
require_relative 'topological_sort'

def install_order(arr)
  vertices = [*1..arr.flatten.max].map {|num| Vertex.new(num)}
  arr.each {|tuple| Edge.new(vertices[tuple[1] - 1], vertices[tuple[0] - 1])}

  topological_sort(vertices).map {|vertex| vertex.value}
end
