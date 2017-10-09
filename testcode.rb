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

def make_change(target, coins)
  return [] if target == 0
  return nil if coins.empty?

  coins = coins.sort.reverse

  combs = []

  coins.each_with_index do |coin, idx|
    next if coin > target
    remainder = target - coin
    prev_change = make_change(remainder, coin.drop(idx))
    next if prev_change.nil?

    current_change = prev_change.each do |comb|
      [coin] + comb.dup
    end
  end
end
