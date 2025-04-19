## 🌊 Endless Ranges for Infinite Sequences

Endless ranges (`start..`) let you represent an unbounded interval starting at `start`. They work with methods like `take_while`, `lazy`, or iteration protocols to generate or filter items without a fixed endpoint.

```ruby
# Generate all integers from 10 upwards, filtering even ones
evens = (10..).lazy.select(&:even?).first(5)
puts evens.inspect # => [10, 12, 14, 16, 18]

# Stream lines from STDIN until a blank line
STDIN.each_line.take_while { |line| !(line.strip.empty?) }.each do |l|
  puts l.upcase
end
```