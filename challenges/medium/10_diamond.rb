
# Diamond

# The diamond exercise takes as its input a letter, and
# outputs it in a diamond shape. Given a letter, it prints
# a diamond starting with 'A', with the supplied letter at
# the widest point.

#     The first row contains one 'A'.
#     The last row contains one 'A'.
#     All rows, except the first and last, have exactly two identical letters.
#     The diamond is horizontally symmetric.
#     The diamond is vertically symmetric.
#     The diamond has a square shape (width equals height).
#     The letters form a diamond shape.
#     The top half has the letters in ascending order.
#     The bottom half has the letters in descending order.
#     The four corners (containing the spaces) are triangles.

class Diamond
  def self.make_diamond(letter)
    return "A\n" if letter.upcase == 'A'

    alphabet = ('A'..'Z').to_a
    max_width = alphabet.index(letter.upcase) * 2 + 1
    outer_line = "A".center(max_width) + "\n"
    top_of_diamond = [outer_line]
    
    middle_space = 1
    idx = 1

    alphabet.index(letter).times do |i|
      current_letter = alphabet[idx]
      line = (current_letter + (" " * middle_space) + current_letter).center(max_width)
      top_of_diamond << line + "\n"
      idx += 1
      middle_space += 2
    end

    bottom_of_diamond = top_of_diamond.reverse[1..-1]
    (top_of_diamond + bottom_of_diamond).join
  end
end

# p Diamond.make_diamond('C')
