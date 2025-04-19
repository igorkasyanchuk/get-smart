## ⚡ Boost Performance with Atomic Groups

Atomic groups `(?>...)` prevent backtracking into the group once matched, eliminating catastrophic backtracking for certain patterns. Use them around greedy alternatives when backtracking isn’t needed.

```ruby
# Without atomic group—can backtrack excessively
bad = /(\d+|\d{1,3})XYZ/
# With atomic group—no backtracking inside
good = /(?>\d+|\d{1,3})XYZ/

p bad.match?("123XYZ")  # => true
p good.match?("123XYZ") # => true
```

Apply atomic groups to sanitize complex alternations and protect performance.