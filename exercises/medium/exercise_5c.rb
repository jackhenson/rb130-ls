items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |fruit, *food |
  puts fruit
  puts food.join(', ')
end

# Desired output
# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!