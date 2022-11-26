
# Clock

# Create a clock that is independent of date.

# You should be able to add minutes to and subtract
# minutes from the time represented by a given Clock
# object. Note that you should not mutate Clock objects
# when adding and subtracting minutes -- create a new
# Clock object.

# Two clock objects that represent the same time should
# be equal to each other.

# You may not use any built-in date or time functionality;
# just use arithmetic operations.

class Clock
  attr_reader :hour, :minutes

  def self.at(h, m=0)
    h = 24 if h == 0 && m == 0
    self.new(h, m)
  end

  def initialize(h, m)
    @hour = h
    @minutes = m 
  end

  def to_s
    "#{format("%.2i", hour)}:#{format("%.2i", minutes)}"
  end

  def +(m)
    total_mins = (hour.to_i * 60) + minutes.to_i
    total_mins += m

    new_hour = case (total_mins / 60)
               when (1..23)
                 total_mins / 60
               else
                 (total_mins / 60) % 24
               end
          
    new_minutes = total_mins % 60

    self.class.at(new_hour, new_minutes)
  end

  def -(m)
    total_mins = (hour.to_i * 60) + minutes.to_i
    total_mins -= m

    new_hour = case (total_mins / 60)
               when (1..23)
                 total_mins / 60
               else
                 (total_mins / 60) % 24
               end
          
    new_minutes = total_mins % 60

    self.class.at(new_hour, new_minutes)
  end

  def ==(other_clock)
    hour == other_clock.hour && minutes == other_clock.minutes
  end
end

p Clock.at(24).to_s
p Clock.at(11, 9).to_s
