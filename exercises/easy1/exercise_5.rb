# The following list contains the names of 
# individuals who are pioneers in the field 
# of computing or that have had a significant 
# influence on the field. The names are in an 
# encrypted form, though, using a simple 
# (and incredibly weak) form of encryption 
# called Rot13.

# Nqn Ybirynpr
# Tenpr Ubccre
# Nqryr Tbyqfgvar
# Nyna Ghevat
# Puneyrf Onoontr
# Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
# Wbua Ngnanfbss
# Ybvf Unvog
# Pynhqr Funaaba
# Fgrir Wbof
# Ovyy Tngrf
# Gvz Orearef-Yrr
# Fgrir Jbmavnx
# Xbaenq Mhfr
# Fve Nagbal Ubner
# Zneiva Zvafxl
# Lhxvuveb Zngfhzbgb
# Unllvz Fybavzfxv
# Tregehqr Oynapu

# Write a program that deciphers and prints 
# each of these names.

def decipher(name)
  alphabet = ('a'..'z').to_a
  result = name.chars.map do |letter|
    # return ' ' if letter == ' '
    new_index = (alphabet.index(letter.downcase) + 13)
    new_index -= 26 if (new_index > 25)
    if letter.upcase == letter
      alphabet[new_index].upcase
    else
      alphabet[new_index]
    end
  end

  result.join
end
                
p decipher("Nqn Ybirynpr")