# Our solution uses Enumerable#each for the main loop.
# The advantage of doing this is that any? will work
# with any Enumerable collection, including Arrays,
# Hashes, Sets, and more. So, even though we only need
# any? to work with Arrays, we get additional functionality
# for free.

# Does your solution work with other collections like
# Hashes or Sets?
require 'set'

def any?(arr)
  arr.each do |e|
    return true if yield(e)
  end

  false
end

# Works with Sets

s1 = [1, 3, 5, 6].to_set
s2 = Set.new([1, 3, 5, 6])

p any?(s1) { |value| value.even? } == true
p any?(s2) { |value| value.even? } == true

# Can work with Hashes, changes required for block argument

h1 = {1 => 1, 2 => 3, 3 => 5, 4 => 5, 5 => 6}
p any?(h1) { |_, value| value.even? } == true

# p any?([1, 3, 5, 7]) { |value| value.even? } == false
# p any?([2, 4, 6, 8]) { |value| value.odd? } == false
# p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
# p any?([1, 3, 5, 7]) { |value| true } == true
# p any?([1, 3, 5, 7]) { |value| false } == false
# p any?([]) { |value| true } == false