
# Scrabble Score

# Write a program that, given a word, computes
# the Scrabble score for that word.

# Letter Values

# You'll need the following tile scores:
# Letter 	Value
# A, E, I, O, U, L, N, R, S, T 	1
# D, G 	2
# B, C, M, P 	3
# F, H, V, W, Y 	4
# K 	5
# J, X 	8
# Q, Z 	10

# How to Score

# Sum the values of all the tiles used in each word.
#  For instance, lets consider the word CABBAGE which
#  has the following letters and point values:

#     3 points for C
#     1 point for each A (there are two)
#     3 points for B (there are two)
#     2 points for G
#     1 point for E

# Thus, to compute the final total (14 points), we count:

# 3 + 2*1 + 2*3 + 2 + 1
# => 3 + 2 + 6 + 3
# => 5 + 9
# => 14

POINT_VALUES = { ['a', 'e', 'i', 'o', 'u', 'l', 'n', 'r', 's', 't'] => 1,
                 ['d', 'g'] => 2,
                 ['b', 'c', 'm', 'p'] => 3,
                 ['f', 'h', 'v', 'w', 'y'] => 4,
                 ['k'] => 5,
                 ['j', 'x'] => 8,
                 ['q', 'z'] => 10
                }

# p POINT_VALUES.keys
# p POINT_VALUES[["k"]]

class Scrabble
  def initialize(word)
    @word = word
  end

  def score
    return 0 if @word.nil?
    return 0 unless @word.downcase.match? /[a-z]/
    @word.downcase.chars.map { |c| letter_score(c) }.sum
  end

  def self.score(word)
    self.new(word).score
  end

  private

  def letter_score(letter)
    POINT_VALUES.keys.each do |l|
      return POINT_VALUES[l] if l.include? letter
    end
  end
end