## 🔁 Repeating an Action with times
`Integer#times` runs a block a specified number of times. This is a quick way to repeat logic without managing loop counters yourself.

```ruby
5.times do |i|
  puts "Iteration "+ (i + 1).to_s
end
# Output:
# Iteration 1
# Iteration 2
# Iteration 3
# Iteration 4
# Iteration 5
```