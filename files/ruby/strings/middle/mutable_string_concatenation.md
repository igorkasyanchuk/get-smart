## ⚡️ Optimize Concatenation with << vs +
Using `<<` (shovel) mutates the original string in place and is more memory-efficient than `+`, which allocates a new string each time. When building up large or iterative strings, prefer `<<` to reduce GC pressure and improve performance.

```ruby
# Less efficient
result = ""
1000.times { |i| result = result + "Line #{i}\n" }

# More efficient
buffer = ""
1000.times { |i| buffer << "Line #{i}\n" }
```