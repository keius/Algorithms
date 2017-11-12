require 'byebug'

def subsets(arr)
  return [[]] if arr.empty?

  last = arr.pop
  prev_sets = subsets(arr)

  new_sets = prev_sets.map do |subset|
    subset.dup << last
  end

  prev_sets + new_sets
end

def permutations(arr)
  return [[]] if arr.empty?

  perms = []

  (0...arr.length).each do |i|
    subarr = arr.take(i) + arr.drop(i+1)
    prev_perms = permutations(subarr)
    next_perms = prev_perms.map do |perm|
      perm.dup << arr[i]
    end
    perms += next_perms
  end

  perms
end

def parentheses(n)
  combs = []
  addpar(combs, "", n, 0)
  combs
end

def addpar(result, str, left, right)
  if left == 0 && right == 0
    result << str
  end

  addpar(result, str + "(", left - 1, right + 1) if left > 0
  addpar(result, str + ")", left, right - 1) if right > 0
end

class TreeNode
  attr_reader :value
  attr_accessor :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

def inorder_traversal(root)
  return [] if root.nil?

  traversed = []

  traversed << root.value
  traversed += inorder_traversal(root.left)
  traversed += inorder_traversal(root.right)

  traversed
end

def cycle?(arr)
  return false if arr.empty?

  visited = {}
  queue = [0]

  until queue.empty?
    current_node = queue.shift
    next if visited[current_node]
    return true if arr[current_node].any? {|out_edge| visited[out_edge]}
    visited[current_node] = true
    queue += arr[current_node]
  end

  return false
end

arr = [[1], [2], [3,4], [4], [0]]
arr2 = [[1,2,3], [2,3], [3], []]

print cycle?(arr)
