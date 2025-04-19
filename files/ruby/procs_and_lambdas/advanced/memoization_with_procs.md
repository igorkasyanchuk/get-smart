## 💾 Memoization Strategies with Procs
Wrap expensive computations in a Proc and store results in a cache hash for on-demand evaluation. This approach decouples caching logic from business code, making it composable and testable.

```ruby
memoized = ->(f) {
  cache = {}
  ->(arg) {
    cache[arg] ||= f.call(arg)
  }
}

# Define an expensive function
fib = ->(n) { n < 2 ? n : fib.call(n-1) + fib.call(n-2) }

# Wrap with memoization
fast_fib = memoized.call(fib)
puts fast_fib.call(30)  # Runs quickly due to caching
```