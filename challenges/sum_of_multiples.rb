# Sum of multiples

# Write a program that, given a natural number and
# a set of one or more other numbers, can find the
# sum of all the multiples of the numbers in the
# set that are less than the first number. If the
# set of numbers is not given, use a default set
# of 3 and 5.

# For instance, if we list all the natural numbers
# up to, but not including, 20 that are multiples
# of either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15,
# and 18. The sum of these multiples is 78.


class SumOfMultiples
  attr_reader :set

  def initialize(*set)
    @set = (set.size > 0) ? set : [3, 5]
  end

  def self.to(max)
    self.new.to(max)
  end

  def to(max)
    result = []
    set.each do |num|
      multiplier = 1
      loop do
        multiple = num * multiplier
        break if multiple >= max
        result << multiple
        multiplier += 1
      end
    end
    # filter out duplicates and return sum
    result.uniq.sum
  end
end

p SumOfMultiples.to(100)