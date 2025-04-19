## 🐛 Efficient in-memory IO with StringIO

`StringIO` emulates an IO object backed by a String. Instead of juggling indexes or slices, you can use familiar `IO` methods (`read`, `gets`, `seek`) on raw data. This is ideal for streaming parsers or when you need IO-like semantics without disk overhead.

```ruby
require 'stringio'
stream = StringIO.new("line1\nline2\n")
while chunk = stream.gets
  puts "Chunk: #{chunk.chomp}"
end
# => Chunk: line1
# => Chunk: line2
```