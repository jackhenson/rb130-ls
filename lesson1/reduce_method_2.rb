def reduce(arr, start=arr[0])
  counter = case start
            when arr[0] then 1
            else 0
            end
  
  total = start

  while counter < arr.size
    current_element = arr[counter]
    total = yield(total, current_element)
    counter += 1
  end

  total
end

array = [1, 2, 3, 4, 5]

p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']