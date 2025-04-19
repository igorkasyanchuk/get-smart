## ⚡ Flip-Flop Operator in Conditional Ranges

Ruby’s flip-flop operator (`expr1..expr2`) toggles state when `expr1` becomes truthy and resets when `expr2` does. It’s useful for processing blocks of text or lines between markers without extra state variables.

```ruby
data = ["start", "a", "b", "end", "x", "start", "y", "end"]
data.each do |line|
  if (line == "start")..(line == "end")
    puts line
  end
end
# Output:
# start
a
# b
# end
# start
# y
# end
```