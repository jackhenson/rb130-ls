# Write a program to determine whether a 
# triangle is equilateral, isosceles, or scalene.

# An equilateral triangle has all three sides the 
# same length.

# An isosceles triangle has exactly two sides of 
# the same length.

# A scalene triangle has all sides of different lengths.

# Note: For a shape to be a triangle at all, all 
# sides must be of length > 0, and the sum of the 
# lengths of any two sides must be greater than the 
# length of the third side.

# **Problem**
# To be a valid triangle, each side length > 0
# To be a valid triangle, the sum of lenghts of any
#   two sides must be greater than the length of remaining side
# equilateral: 3 sides of equal length
# isosceles: 2 sides of equal length
# scalene: no 2 sides have equal length

# **Examples**
# Provided test cases indicate these requirements:
# - Triangle class with two methods:
#   - a constructor that accepts 3 arguments for 3 sides
#     - exception raised in constructor if any side length <= 0
#     - exception raised if side lengths don't describe valid triangle
#   - a method, kind, that returns string representing type of triangle

# **Data Structures**
# - Provided test cases show we are using Integers to create
#     a new triangle and determine its validity and type.
#     Return value is a string.
# - How to store triangle's side lengths?
#   - Maybe collect 3 side lengths in Array

# **Algorithm**
# - Constructor
#   - Save the 3 side lengths
#   - Check whether any side length is less than or equal to 0
#       If so, raise an ArgumentError
#   - Use comparisons to determine whether the sum of any 2 sides
#       is less than or equal to the length of third side.
#       If so, raise an ArgumentError
#
#  - Method: kind
#     - Compare the values representing  3 side lengths
#     - If all 3 side lengths equal, return 'equilateral'
#     - If not equliateral but any 2 side lengths equal to one another
#         return 'isosceles'
#     - If none of the sides are equal, return 'scalene'

# My solution:

class Triangle
  attr_reader :kind

  def initialize(side1, side2, side3)
    sides = [side1, side2, side3]
    first_sides = sides[0, 2]
    last_sides = sides[1,2]

    # checks for valid triangle
    raise ArgumentError unless sides.all? { |s| s.positive? }
    
    raise ArgumentError unless first_sides.sum > sides.last && last_sides.sum > sides.first

    @kind = case sides.uniq.size
            when 1 then "equilateral"
            when 2 then "isosceles"
            when 3 then "scalene"
            end
  end
end

# Provided solution:

# class Triangle
#   attr_reader :sides

#   def initialize(side1, side2, side3)
#     @sides = [side1, side2, side3]
#     raise ArgumentError.new "Invalid triangle lengths" unless valid?
#   end

#   def kind
#     if sides.uniq.size == 1
#       'equilateral'
#     elsif sides.uniq.size == 2
#       'isosceles'
#     else
#       'scalene'
#     end
#   end

#   private

#   def valid?
#     sides.min > 0 &&
#     sides[0] + sides[1] > sides[2] &&
#     sides[1] + sides[2] > sides[0] &&
#     sides[0] + sides[2] > sides[1]
#   end
# end