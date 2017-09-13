def combs(n, arr)
  results = [[]]
  n.times do
    results.length.times do
      comb = results.shift
      arr.each do |num|
        results << (comb + [num])
      end
    end
  end
  results
end

print combs(3, [1,2,3])
