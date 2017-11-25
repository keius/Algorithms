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



def nested_string(arr)
  depth_map = {}
  print_arr = []

  queue = arr

  until queue.empty?
    current = queue.shift

    if depth_map[current["name"]]
      print_arr << current["owns"] unless depth_map[current["owns"]]
      depth_map[current["owns"]] = depth_map[current["name"]] + 1
    else
      print_arr << current["name"] unless depth_map[current["name"]]
      depth_map[current["name"]] = 0
      depth_map[current["owns"]] = depth_map[current["name"]] + 1
    end



    selected = queue.select {|el| el["name"] == current["owns"]}
    rejected = queue.reject {|el| el["name"] == current["owns"]}

    queue = selected + rejected
  end

  print_arr.each do |el|
    tabspace = " " * depth_map[el]
    puts tabspace + "-#{el}"
  end
end


arr = [
  {"name" => "Joe", "owns" => "Clover"},
  {"name" => "Joe", "owns" => "Joe's Yolk"},
  {"name" => "Joe", "owns" => "L's Holdings"},
  {"name" => "Joe's Yolk", "owns" => "Google"},
  {"name" => "Joe's Yolk", "owns" => "Facebook"},
  {"name" => "L's Holdings", "owns" => "L Trust"},
  {"name" => "L's Holdings", "owns" => "Banana"},
  {"name" => "L Trust", "owns" => "Apple"}
]

nested_string(arr)
