# Exploring Procs, Lambdas, and Blocks: 
# Definition and Arity

# Group 1
# my_proc = proc { |thing| puts "This is a #{thing}." }
# puts my_proc
# puts my_proc.class
# my_proc.call
# my_proc.call('cat')

# Observation notes:
# Proc#call expected arg, but did NOT
#   raise exception when called without args
#   instead block local variable `thing` returned nil



# Group 2
# my_lambda = lambda { |thing| puts "This is a #{thing}." }
# my_second_lambda = -> (thing) { puts "This is a #{thing}." }
# puts my_lambda
# puts my_second_lambda
# puts my_lambda.class
# my_lambda.call('dog')
# my_lambda.call
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }

# Observation notes:
# Proc#call expected arg, and DID raise exception
#   when called without args



# Group 3
# def block_method_1(animal)
#   yield
# end

# block_method_1('seal') { |seal| puts "This is a #{seal}."}
# block_method_1('seal')

# Observation notes:
# Method def w/ yield (no arg passed to yield)
#   When called w/ block and no arg passed to yield
#   - block local variable 'seal' returns nil
#   When called w/ NO block
#   - LocalJumpError



# # Group 4
# def block_method_2(animal)
#   yield(animal)
# end

# block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
# block_method_2('turtle') do |turtle, seal|
#   puts "This is a #{turtle} and a #{seal}."
# end
# block_method_2('turtle') { puts "This is a #{animal}."}

# Observation notes:
# Method def w/ yield (arg passed to yield)
#   When called w/ block and block parameter
#   - expected output
#   When called w/ block and EXTRA block parameter
#   - extra block parameter evaluates to nil
#   When called w/ block and NO block parameter
#   - NameError: undefined local variable or method 'animal'
