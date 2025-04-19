## 🚨 Error Handling and Wrapping Using Lambdas
Encapsulate error-handling logic in a lambda to isolate rescue clauses and return uniform result objects or defaults. This approach makes your core code paths error-agnostic and simplifies retry logic.

```ruby
safe = ->(fn, fallback = nil) {
  ->(*args) {
    fn.call(*args)
  rescue StandardError => e
    {error: e, result: fallback}
  }
}

# Wrap an unstable operation
unstable = ->(x) { raise "oops" if x.zero?; 100 / x }
safe_unstable = safe.call(unstable, 0)

puts safe_unstable.call(0)  # => {:error=>#<RuntimeError: oops>, :result=>0}
```