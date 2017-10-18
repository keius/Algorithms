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

def count_battleships(board)
    count = 0

    (0...board.length).each do |row|
        (0...board[0].length).each do |col|
            count += check_ship(board, row, col) if board[row][col] =="X"
        end
    end

    count
end

def check_ship(board, row, col)
  neighbors = [[0, 1], [1, 0], [0, -1], [-1, 0]]
  neighbor_ship = nil
  neighbors.each do |delta|
      if (row + delta[0]).between?(0, board.length - 1) && (col + delta[1]).between?(0, board[0].length - 1) && board[row + delta[0]][col + delta[1]] == "X"
          neighbor_ship = [row + delta[0], col + delta[1]]
      end
  end

  board[row][col] = "."

  if neighbor_ship
      check_ship(board, neighbor_ship[0], neighbor_ship[1])
  else
      return 1
  end
end

def find_duplicates(nums)
    dups = []
    debugger
    nums.each_index do |i|
        index = (nums[i] % nums.length)
        nums[index] += nums.length
    end

    nums.each_index do |i|
        dups << i if (nums[i] / nums.length) > 1
    end

    dups
end

print find_duplicates([4,3,2,7,8,2,3,1])
