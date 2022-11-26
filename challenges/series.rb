
# Series

# Write a program that will take a string of digits
# and return all the possible consecutive number
# series of a specified length in that string.

# For example, the string "01234" has the following
# 3-digit series:

#     012
#     123
#     234

# Likewise, here are the 4-digit series:

#     0123
#     1234

# Finally, if you ask for a 6-digit series from a
# 5-digit string, you should throw an error.

class Series
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def slices(n)
    raise ArgumentError if n > number.size
    result = []
    number.chars.map(&:to_i).each_cons(n) {|e| result.push(e)}
    result
  end
end