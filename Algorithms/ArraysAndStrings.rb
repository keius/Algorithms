def is_unique?(str)
  looked = []
  (0...str.length).each do |i|
    return false if looked.include?(str[i])
    looked << str[i]
  end
  return true
end

def check_permutation(str1, str2)
  counts1 = Hash.new(0)
  counts2 = Hash.new(0)
  str1.each_char do |ch|
    counts1[ch] += 1
  end
  str2.each_char do |ch|
    counts2[ch] += 1
  end
  counts1 == counts2
end

def URLify(str)
  new_str = ""
  str.each_char do |ch|
    if ch == " "
      new_str << "%20"
    else
      new_str << ch
    end
  end
  new_str
end

print URLify("Mr John Smith")
