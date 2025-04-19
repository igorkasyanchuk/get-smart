## 🏎️ Stream Processing with StringScanner

For high‑speed, iterative parsing, use `StringScanner` to advance through text without re‑scanning from the start. Perfect for lexing or log‑file processing.

```ruby
require 'strscan'
s = StringScanner.new("id:123, name:John; id:456, name:Jane;")

while !s.eos?
  s.scan(/id:(\d+)/)
  id = s[1]
  s.scan(/, name:(\w+);/) && name = s[1]
  puts "User ##{id} is #{name}"
end
# Output:
# User #123 is John
# User #456 is Jane
```