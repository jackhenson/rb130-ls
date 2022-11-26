
# Robot Name

# Write a program that manages robot
# factory settings.

# When robots come off the factory floor,
# they have no name. The first time you boot
# them up, a random name is generated, such
# as RX837 or BC811.

# Every once in a while, we need to reset a
# robot to its factory settings, which means
# that their name gets wiped. The next time
# you ask, it will respond with a new random name.

# The names must be random; they should not follow
# a predictable sequence. Random names means there
# is a risk of collisions. Your solution should not
# allow the use of the same name twice.

class Robot
  attr_reader :name
  
  @@robot_names = []

  def initialize
    reset
  end

  def reset
    @@robot_names.delete(name)
    @name = generate_name
    @@robot_names << name
  end

  private

  def generate_name
    loop do
      result = "#{random_letter}#{random_letter}#{random_num}#{random_num}#{random_num}"
      return result unless @@robot_names.include? result
    end
  end

  def random_letter
    alphabet = ('A'..'Z').to_a
    alphabet[rand(alphabet.size-1)]
  end

  def random_num
    rand(9)
  end
end