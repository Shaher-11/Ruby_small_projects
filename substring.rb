
def substrings(string, dictionary)        # define the method 
    matches = {}                    # then  create an empty hash
  
    dictionary.each do |word|             # iterate over the words 

      matches[word] = string.downcase.scan(word).count if string.downcase.include?(word) # use the built in methods for checking each matched word
    end
    matches
  end
  
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"] # we can always add more words 

p substrings("below", dictionary)
p substrings("Howdy partner, sit down! How's it going?", dictionary)
