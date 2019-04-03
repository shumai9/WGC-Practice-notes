require 'pry'

class Array

 def bubble_sort
    sweep = self.length - 1 #number of comparisons
    swapped = true
     while swapped
         swapped = false
         i = 0
         while i < sweep
         binding.pry
             if self[i] > self[i+1]
               self[i], self[i+1] = self[i+1], self[i] #swap if current number is greater than the next number
               swapped = true
             end
           i += 1
         end
     end
   self
 end
end

array = [13, 4, 3, 20, 11, 14, 16, 19, 12, 2, 9, 5, 6, 8, 17, 1, 10, 7, 18, 15]

print array.bubble_sort
