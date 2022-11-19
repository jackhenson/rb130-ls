# Internal vs External Iterators

factorials = Enumerator.new do |y|
  n = 0
  loop do
    result = case n
             when 0..1 then 1
             else (1..n).inject(:*)
             end
      
    y << result
    n += 1
  end
end

p factorials.next
p factorials.next
p factorials.next
p factorials.next
p factorials.next
p factorials.next
p factorials.next

p factorials.next
p factorials.next
p factorials.next

factorials.rewind

p factorials.next
p factorials.next
p factorials.next
p factorials.next
p factorials.next
p factorials.next
p factorials.next