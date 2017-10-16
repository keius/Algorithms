require_relative 'p05_hash_map'

def can_string_be_palindrome?(string)
  letter_counts = HashMap.new(string.length)

  string.chars do |ch|
    if letter_counts[ch]
      letter_counts[ch] += 1
    else
      letter_counts[ch] = 1
    end
  end

  odds = letter_counts.reject {|k, v| v % 2 == 0}
  odds.length <= 1
end
