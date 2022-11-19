# Fill in the missing part of the following code
# so we can convert an array of integers to
# base 8 (octal numbers). 

# Replace the two `method_name` placeholders with
# actual method calls
def convert_to_base_8(n)
  n.to_s(8).to_i
end

# Replace `argument` with the correct argument below
# `method` is `Object#method`, not a placeholder
base8_proc = method(:convert_to_base_8).to_proc

# We'll need a Proc object to make this code work
# Replace `a_proc` with the correct object
p [8, 10, 12, 14, 16, 33].map(&base8_proc)

# Expected output:
# [10, 12, 14, 16, 20, 41]