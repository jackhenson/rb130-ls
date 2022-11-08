# Write a method that takes an optional block. 
# If the block is specified, the method should 
# execute it, and return the value returned by 
# the block. If no block is specified, the method 
# should simply return the String 'Does not compute.'.

# Examples:

# compute { 5 + 3 } == 8
# compute { 'a' + 'b' } == 'ab'
# compute == 'Does not compute.'

def compute(arg)
  return yield(arg) if block_given?
  "Does not compute"
end

p compute(5)

p compute(5) { "String inside block" }

compute(5) { |num| puts num }