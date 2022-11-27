
# Simple Linked List

# Write a simple linked list implementation.
# The linked list is a fundamental data structure
# in computer science, often used in the
# implementation of other data structures.

# The simplest kind of linked list is a singly
# linked list. Each element in the list contains
# data and a "next" field pointing to the next
# element in the list of elements. This variant
# of linked lists is often used to represent
# sequences or push-down stacks (also called a LIFO
#   stack; Last In, First Out).

# Let's create a singly linked list whose elements
# may contain a range of data such as the numbers 1-10.
# Provide methods to reverse the linked list and
# convert a linked list to and from an array.

class Element
  attr_reader :datum, :next

  def initialize(datum, next_value=nil)
    @datum = datum
    @next = next_value
  end

  def tail?
    self.next.nil?
  end
end

class SimpleLinkedList
  attr_reader :list

  def initialize
    @list = []
  end

  def push(datum)
    list.prepend(Element.new(datum, list.first))
  end

  def pop
    list.shift.datum
  end

  def size
    list.size
  end

  def empty?
    list.empty?
  end
  
  def peek
    head.nil? ? nil : head.datum
  end

  def head
    last_added_element = list.first
  end

  def self.from_a(arr)
    new_list = self.new
    return new_list if arr.nil?
    
    arr.reverse.each do |e|
      new_list.push(e)
    end
    
    new_list
  end

  def to_a
    list.map(&:datum)
  end

  def reverse
    reverse_list = list.reverse.map(&:datum)
    self.class.from_a(reverse_list)
  end
end