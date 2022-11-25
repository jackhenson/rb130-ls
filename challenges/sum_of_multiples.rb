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
  attr_reader :max, :set

  def initialize(*set)
    @set = set
  end

  def self.to(max)
    self.new(3, 5).to(max)
  end

  def to(max)
    result = []
    set.each do |num|
      multiplier = 1
      loop do
        multiple = num * multiplier
        break if multiple > max
        result << multiple
        multiplier += 1
      end
    end
    result.sum
  end
end