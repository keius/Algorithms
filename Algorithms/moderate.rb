def min_diff(arr1, arr2)
  return -1 if arr1.empty? || arr2.empty?

  arr1.sort!
  arr2.sort!

  min_diff = (arr1[0] - arr2[0]).abs

  i = 0
  j = 0


  while i < arr1.length && j < arr2.length
    diff = (arr1[i] - arr2[j]).abs
    min_diff = diff if diff < min_diff
    if arr1[i] < arr2[j]
      i += 1
    else
      j += 1
    end
  end

  min_diff
end

# print min_diff([1,2,11,16], [])

def max(a, b)
  k = (a - b) >> 31
  q = k ^ 1

  (a * q) + (b * k)
end

puts max(5, 3)
