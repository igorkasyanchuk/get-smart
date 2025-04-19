## 🧠 Memoized Inject for Expensive Computations
Combine Enumerable#inject with internal caching to avoid recomputing expensive operations on repeated elements. This pattern is useful for dynamic programming algorithms over arrays.

```ruby
results = {}
values  = [5, 10, 15]

fib = lambda do |n|
  return results[n] if results[n]
  results[n] = (n < 2 ? n : fib.call(n-1) + fib.call(n-2))
end

sequence = values.inject([]) do |acc, n|
  acc << fib.call(n)
end
puts sequence.inspect  # => [5, 55, 610]
```