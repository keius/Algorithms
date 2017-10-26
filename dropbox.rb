def  wordpattern(pattern, input)
  if basepattern(pattern, input)
    return true
  else
    chunk_size = 1
    until chunk_size == input.length - 1
      chunk = input[0...chunk_size]
      chunk_indices = find_all_indices(input, chunk)
      chunk_removed = ""
      input.each_index {|i| chunk_removed += input[i] unless chunk_indices.include?(i)}

      pattern_chunk = pattern[0]
      pattern_indices = find_all_indices(pattern, pattern_chunk)
      pattern_chunk_removed = ""
      pattern.each_index {|i| pattern_chunk_removed += input[i] unless pattern_indices.include?(i)}

      return true if wordpattern(pattern_chunk_removed, chunk_removed)
    end
  end
  return false
end

def basepattern(pattern, input)
  return true if pattern.empty? || input.empty?
  size = input.length / pattern.length
  scanner = input[0...size]
  input.split(scanner).empty?
end

def find_all_indices(string, substring)
  indices = []
  (0..string.length - substring.length).each do |i|
    if string[i...i+substring.length] == substring
      indices += [*i...i+substring.length]
    end
  end
  indices
end
