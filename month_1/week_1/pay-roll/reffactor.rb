require 'prime'  

def first_n_primes(n)
  
  puts n <= 0 ? "n must be an integer." : "n must be greater than 0."

  return Prime.first n
end

 first_n_primes(10)