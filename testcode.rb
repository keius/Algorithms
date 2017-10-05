require 'byebug'

def magic_index(arr, start_idx = 0, end_idx = 0)
  return false if arr.length < 1
  mid = start_idx + end_idx / 2

  case arr[mid] <=> mid
  when 0
    return true
  when 1
    magic_index(arr, mid + 1, end_idx)
  when -1
    magic_index(arr, start_idx, mid - 1)
  end
end

print magic_index([1, 2, 3, 9])
