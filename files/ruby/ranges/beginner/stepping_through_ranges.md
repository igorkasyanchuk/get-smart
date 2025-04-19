## 🛠️ Stepping Through Ranges with `step`

The `step` method lets you skip values when iterating a range, which is great for generating sequences with a fixed increment.

```ruby
(0..10).step(2) do |n|
  puts n
end

# Output:
# 0
# 2
# 4
# 6
# 8
# 10
```