## ⚖️ Flip-Flop Operator
Ruby's rare flip-flop operator (`..` or `...` in boolean context) toggles state between two conditions. It’s handy in line-based processing like parsing logs.

```ruby
lines = %w[START a b END c d START x y END]
on = false

lines.each do |line|
  if (line == 'START')..(line == 'END')
    puts "Processing: #{line}"
  end
end
# Outputs lines from START through END twice
```