require 'byebug'

def subsets(arr)
  return [[]] if arr.empty?
  (0..arr.length - 1).each do |i|
    print arr.take(i) + arr.drop(i+1)
  end
end

print subsets([1, 2])
