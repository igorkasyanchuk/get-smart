## 🎲 Efficient Prime Enumeration with Pollard’s Rho

For cryptographic or number‐theory tasks, Ruby’s `Prime` can be slow on huge numbers. Implement Pollard’s Rho and wrap it in a lazy `Enumerator` to factor or test large integers on demand without blocking your main thread.

```ruby
require 'prime'

def pollards_rho(n)
  return n if n.even?
  x, y, d = 2, 2, 1
  f = ->(v){ (v*v + 1) % n }
  until d != 1
    x = f[x]
    y = f[f[y]]
    d = (x - y).abs.gcd(n)
  end
  d == n ? nil : d
end

# Lazy prime factorization
Prime.lazy.select { |p| p > 2 }.first(100)       # first 100 odd primes
factor = pollards_rho(10**18 + 3)                # factor a 64-bit-ish composite
puts "Found factor: #{factor}" if factor
```
