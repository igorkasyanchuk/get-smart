## 📦 Storing Procs in Collections

You can store multiple procs or lambdas in arrays or hashes for dynamic dispatch or configurable pipelines. This pattern is helpful for building flexible workflows or middleware stacks.

```ruby
steps = [
  proc { |n| n + 1 },
  ->(n) { n * 2 },
  proc { |n| n - 3 }
]

value = steps.reduce(5) { |acc, fn| fn.call(acc) }
puts value  # => ((5+1)*2)-3 = 9
```