## 🛠️ Use `yield` with Arguments for Flexibility

Passing arguments to `yield` lets callers customize behavior without exposing internal variables. You can yield multiple values or even hashes for more complex data structures. This yields flexible APIs while keeping your method signatures simple.

```ruby
def with_logging
  start_time = Time.now
  result = yield
  duration = Time.now - start_time
  puts "Executed in #{duration.round(2)}s"
  result
end

value = with_logging do
  sleep(0.5)
  "done"
end
# => "done" and logs execution time
```