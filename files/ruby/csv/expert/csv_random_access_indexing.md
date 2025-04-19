## 🚀 Random Access via Row Offset Indexing

Implement O(1) row lookup by building an offset index and seeking directly to line positions. This pattern avoids full scans and enables efficient random sampling.

```ruby
require 'csv'

offsets = []
File.open('data.csv', 'r') do |file|
  while (line = file.gets)
    offsets << file.pos - line.bytesize
  end
end

# Randomly fetch row 42
File.open('data.csv', 'r') do |file|
  file.pos = offsets[41]
  row = CSV.parse_line(file.gets, headers: false)
  p row
end
```