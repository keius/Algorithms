require 'byebug'

def my_atoi(str)
  debugger
  negative = 1
  number = 0
  start = 0
  (0...str.length).each do |i|
      if str[i] == " "
          start += 1
      elsif str[i] == "-" || str[i] == "+"
          negative = str[i] == "-" ? -1 : 1
      elsif str[i].to_i.is_a? Integer
          number *= 10
          number += str[i].to_i
      else
          next
      end
  end

  number *= negative
  return 2147483647 if number > 2147483647
  return -2147483648 if number < -2147483648
  return number
end

my_atoi("12")
