items = ['apples', 'corn', 'cabbage', 'wheat']

# 1
def gather(*produce, wheat)
  puts "Let's start gathering food."
  p produce
  puts wheat
  puts "We've finished gathering!"
end

# # 2
# def gather(apples, *vegetables, wheat)
#   puts "Let's start gathering food."
#   puts apples
#   p vegetables
#   puts wheat
#   puts "We've finished gathering!"
# end

# # 3
# def gather(apples, *assorted)
#   puts "Let's start gathering food."
#   puts apples
#   p assorted
#   puts "We've finished gathering!"
# end

# # 4
# def gather(apples, corn, cabbage, wheat)
#   puts "Let's start gathering food."
#   puts "#{apples}, #{corn}, #{cabbage}, and #{wheat}"
#   puts "We've finished gathering!"
# end

# method call

gather(*items) # notice we need a splat operator for passing in that array now.