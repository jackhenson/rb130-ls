# Write a method that takes an optional block. 
# If the block is specified, the method should 
# execute it, and return the value returned by 
# the block. If no block is specified, the method 
# should simply return the String 'Does not compute.'.

# Examples:

# compute { 5 + 3 } == 8
# compute { 'a' + 'b' } == 'ab'
# compute == 'Does not compute.'

def method_with_optional_block
  return yield if block_given?
  "Does not compute"
end

p method_with_optional_block

p method_with_optional_block { "String inside block" }