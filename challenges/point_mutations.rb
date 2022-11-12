# Write a program that can calculate the Hamming
# distance between two DNA strands.

# A mutation is simply a mistake that occurs during
# the creation or copying of a nucleic acid, in
# particular DNA. Because nucleic acids are vital
# to cellular functions, mutations tend to cause a
# ripple effect throughout the cell. Although mutations
# are technically mistakes, a very rare mutation may
# equip the cell with a beneficial attribute. In fact,
# the macro effects of evolution are attributable to
# the accumulated result of beneficial microscopic
# mutations over many generations.

# The simplest and most common type of nucleic acid
# mutation is a point mutation, which replaces one
# base with another at a single nucleotide.

# By counting the number of differences between two
# homologous DNA strands taken from different genomes
# with a common ancestor, we get a measure of the 
# minimum number of point mutations that could
# have occurred on the evolutionary path between the
# two strands.

# This is called the Hamming distance.

# GAGCCTACTAACGGGAT
# CATCGTAATGACGGCCT
# ^ ^ ^  ^ ^    ^^

# The Hamming distance between these two DNA strands is 7.

# The Hamming distance is only defined for sequences of
# equal length. If you have two sequences of unequal length,
# you should compute the Hamming distance over the shorter
# length.

# **Problem**
# Create a class DNA with two methods:
#   - Constructor #new
#     - Takes one argument, string from DNA sequence
#   - #hamming_distance
#     - Takes one argument, string for another DNA sequence
#     - returns Integer, hamming distance
#
#  Hamming distance is only defined for sequences of equal length
#   - If sequences of unequal length, compute over shorter length

# My solution:

class DNA
  attr_reader :sequence

  def initialize(sequence)
    @sequence = sequence
  end

  def hamming_distance(other_sequence)
    sequence_length = [sequence.size, other_sequence.size].min
    
    result = 0
    sequence.chars.each_with_index do |char, idx|
      break if idx >= sequence_length
      result += 1 unless char == other_sequence[idx]
    end

    result
  end
end

# Given solution:
# class DNA
#   def initialize(strand)
#     @strand = strand
#   end

#   def hamming_distance(comparison)
#     shorter = @strand.length < comparison.length ? @strand : comparison
#     differences = 0

#     shorter.length.times do |index|
#       differences += 1 unless @strand[index] == comparison[index]
#     end

#     differences
#   end
# end