## ⚡️ Optimize Checks with Range#cover? vs include?
Use `cover?` for numerical ranges to get O(1) boundary checks, whereas `include?` may iterate, causing O(n) cost. In performance‐sensitive code (e.g., hot loops or validations), prefer `cover?` for primitive objects.

```ruby
range = (1..1_000_000)

Benchmark.ips do |x|
  x.report("include? 999_999") { range.include?(999_999) }
  x.report("cover?   999_999") { range.cover?(999_999) }
  x.compare!
end

# include? iterates; cover? uses arithmetic -> significantly faster
```