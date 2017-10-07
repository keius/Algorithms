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

print subsets([1, 2, 3])
