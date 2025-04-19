## 🔄 Control Flow with Flip-Flop Operator
Ruby’s flip-flop (`expr1..expr2`) operator provides stateful conditionals: it turns `true` when `expr1` is true and turns `false` when `expr2` becomes true. This is handy for range-based filtering in loops.

```ruby
lines = (1..10).to_a
selected = []
lines.each do |n|
  if (n == 3..n == 6)
    selected << n
  end
end
puts selected.inspect
# => [3, 4, 5, 6]
```