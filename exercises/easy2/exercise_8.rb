# The Enumerable#max_by method iterates over the
# members of a collection, passing each element to
# the associated block. It then returns the element
# for which the block returned the largest value.

# Write a method called max_by that behaves similarly
# for Arrays. It should take an Array and a block,
#   and return the element that contains the
#   largest value.

# If the Array is empty, max_by should return nil.

# Your method may use #each, #each_with_object,
# #each_with_index, #inject, loop, for, while, or
# until to iterate through the Array passed in as
#   an argument, but must not use any other methods
#   that iterate through an Array or any other collection.

def max_by(arr)
  return nil if arr.empty?

  result_index = 0
  arr.each_with_index do |e, i|
    result_index = i if yield(e) > yield(arr[result_index])
  end

  arr[result_index]
end

# def max_by(arr)
#   return nil if arr.empty?

#   max_result = 0
#   max_element = arr.first
#   counter = 0

#   while counter < arr.size
#     current_element = arr[counter]
#     result = yield(current_element)
#     if result.ord > max_result.ord
#       max_element = current_element
#       max_result = result
#     end
#     counter += 1
#   end

#   max_element
# end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil