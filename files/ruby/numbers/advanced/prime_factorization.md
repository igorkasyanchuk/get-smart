## 🥇 Efficient Prime Factorization with the Prime Module
Ruby’s Prime library provides fast prime enumeration and factorization methods. You can leverage Prime.each for custom factorization logic or use Integer#prime_division to get exponent tuples.

```ruby
require 'prime'

# Model prime factorization
def prime_factors(n)
  factors = []
  Prime.each do |p|
    break if p * p > n
    while (n % p).zero?
      factors << p
      n /= p
    end
  end
  factors << n if n > 1
  factors
end

puts prime_factors(360)         # => [2, 2, 2, 3, 3, 5]
puts 360.prime_division.inspect # => [[2, 3], [3, 2], [5, 1]]
```
