## ♻️ Memoize Expensive Calls Using Lambdas
Use lambdas alongside a hash to cache heavy computations. This avoids repeated work and speeds up your application. Store prior results keyed by input parameters and return cached values on subsequent calls.

```ruby
fib = ->(n, cache = {}) do
  return cache[n] if cache.key?(n)
  cache[n] = n < 2 ? n : fib.call(n-1, cache) + fib.call(n-2, cache)
end

puts fib.call(35)  # computed quickly thanks to memoization
```