# Anagrams

# Write a program that takes a word and a
# list of possible anagrams and selects the
# correct sublist that contains the anagrams
# of the word.

# For example, given the word "listen" and a
# list of candidates like "enlists", "google",
# "inlets", and "banana", the program should
# return a list containing "inlets". Please
# read the test suite for the exact rules
# of anagrams.

class Anagram
  def initialize(str)
    @word = str
  end

  def match(arr)
    arr.each_with_object([]) do |w, a|
      a << w if anagram?(w)
    end
  end

  private

  def anagram?(str)
    str.downcase.chars.sort == @word.downcase.chars.sort &&
        @word.downcase != str.downcase
  end
end