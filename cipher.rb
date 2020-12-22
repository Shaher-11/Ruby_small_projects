
def translate(string, shift)  # we define the method and the para
    string_array = string.split("").map do |char| # we have our chars and we use map to iterate over them
      num_char = char.ord                             #gets  the Integer ordinal of the char
  
      if char.between?('a', 'z')                              # chaecking if the char is lower case
        ((num_char - 'a'.ord + shift) % 26 + 'a'.ord).chr
      elsif char.between?('A', 'Z')                          # or capital case
        ((num_char - 'A'.ord + shift) % 26 + 'A'.ord).chr
      else
        char
      end
    end
  
    string_array.join                             # joining the array into a string 
  end
  p translate("What a string!", 5)

  