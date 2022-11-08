# Write a method that takes a sorted array of
# integers as an argument, and returns an array
# that includes all of the missing integers (in order)
# between the first and last elements of the argument.

# Examples:

# missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
# missing([1, 2, 3, 4]) == []
# missing([1, 5]) == [2, 3, 4]
# missing([6]) == []

# def missing(arr)
#   result = []
#   first_num = arr.first
#   last_num = arr.last

#   current_num = first_num + 1
#   until current_num >= last_num
#     result << current_num unless arr.include? current_num
#     current_num += 1
#   end

#   result
# end

def missing(array)
  result = []
  array.each_cons(2) do |first, second|
    result.concat(((first + 1)..(second - 1)).to_a)
  end
  result
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []