## 🔄 Reading Files in Chunks
For large files, reading in fixed-size chunks prevents loading the entire content into memory. Loop until `read` returns nil to process the file incrementally.

```ruby
File.open('large_data.bin', 'rb') do |file|
  chunk_size = 1024 * 64  # 64KB
  while chunk = file.read(chunk_size)
    process(chunk)
  end
end
```