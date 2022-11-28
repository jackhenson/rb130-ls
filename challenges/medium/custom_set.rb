
# Custom Set

# Create a custom set type.

# Sometimes it is necessary to define a custom
# data structure of some type, like a set. In this
# exercise you will define your own set type. How
# it works internally doesn't matter, as long as it
# behaves like a set of unique elements that can be
# manipulated in several well defined ways.

# In some languages, including Ruby and JavaScript,
# there is a built-in Set type. For this problem,
# you're expected to implement your own custom set type.
# Once you've reached a solution, feel free to play
# around with using the built-in implementation of Set.

# For simplicity, you may assume that all elements of a
# set must be numbers.

class CustomSet
  attr_reader :set

  def initialize(arr=[])
    @set = arr
  end

  def empty?
    set.empty?
  end

  def contains?(element)
    set.include?(element)
  end

  def subset?(other_set)
    return true if other_set.set == set || self.empty?
    set.all? do |e|
      other_set.set.include? e
    end
  end

  def disjoint?(other_set)
    set.none? do |e|
      other_set.set.include? e
    end
  end

  def intersect?(other_set)
    !disjoint?(other_set)
  end

  def intersection(other_set)
    intersecting_elements = set.select { |e| other_set.set.include? e }
    CustomSet.new(intersecting_elements)
  end

  def difference(other_set)
    different_elements = set.select { |e| other_set.set.none? e }
    CustomSet.new(different_elements)
  end

  def union(other_set)
    combined_elements = set + other_set.set
    CustomSet.new(combined_elements)
  end

  def eql?(other_set)
    set.uniq.sort == other_set.set.uniq.sort
  end
  alias_method :==, :eql?

  def add(element)
    set.push(element)
    self.class.new(set)
  end
end