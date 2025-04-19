## ⚡️ Zero-Copy with IO.copy_stream

When copying or streaming large files, Ruby’s `IO.copy_stream` uses OS-level optimizations (like `sendfile`) to minimize user-space copies. This is significantly faster than manual read/write loops.

```ruby
# Copy a file
IO.copy_stream('source.bin', 'dest.bin')

# Copy with offset and limit
IO.copy_stream('huge.iso', 'part.iso', 10_000_000, 50_000_000)
```

This API also works between any objects responding to `#read`/`#write`, such as sockets or subprocess pipes.