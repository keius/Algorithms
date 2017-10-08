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

def parentheses(n, left = n, right = 0)
  return [] if n == 0

  combs = []
  current_string = ""

  while left > 0
    current_string + "("
    left -= 1
    right += 1
  end

  while right > 0
    current_string + ")"
    right -= 1
    combs << current_string
  end
end
