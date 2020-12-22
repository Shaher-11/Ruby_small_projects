
def bubble_sort(list)   # defining the method
    return list if list.size <= 1 # already sorted
    swapped = true
    while swapped do  #iterating over the list
      swapped = false       # chanign the swap value
      0.upto(list.size-2) do |i|
        if list[i] > list[i+1]
          list[i], list[i+1] = list[i+1], list[i] # swap values
          swapped = true
        end
      end    
    end
    list
  end


p bubble_sort([4,3,78,2,0,2])

# note, Ruby already has a built in method for that which is sort and this algorithm is only for exercises 
