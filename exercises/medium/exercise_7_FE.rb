
# # Further Exploration: Bubble Sort with Blocks

# Modify your solution so it only passes one element
# to the block at a time; the block should perform
# some sort of transformation to the argument, and
# #bubble_sort! itself should just use <= to compare
# two values. In other words, you should be able to
# call #bubble_sort! like this:


# Original:
# def bubble_sort!(array)
#   loop do
#     swapped = false
#     1.upto(array.size - 1) do |index|
#       next if array[index - 1] <= array[index]
#       array[index - 1], array[index] = array[index], array[index - 1]
#       swapped = true
#     end

#     break unless swapped
#   end
# end

def bubble_sort!(array)
  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
      first_element = array[index-1]
      second_element = array[index]
      if block_given?
        next if yield(first_element) < yield(second_element)
      else
        next if first_element <= second_element
      end
      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end

    break unless swapped
  end
end

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |value| value.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)