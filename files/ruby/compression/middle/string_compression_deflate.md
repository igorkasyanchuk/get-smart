## 📦 In‑Memory String Compression with Zlib::Deflate

For transient data (e.g., caching JSON payloads), compressing in memory is faster than writing temp files. Use `Zlib::Deflate` to compress a string and `Zlib::Inflate` to restore it. You can tune the compression level (1–9) for speed vs size.

```ruby
require 'zlib'

raw = '{"name":"Alice","role":"admin","data":"..."}'

# Compress with best compression
compressed = Zlib::Deflate.deflate(raw, Zlib::BEST_COMPRESSION)
puts "Compressed from #{raw.bytesize} to #{compressed.bytesize} bytes"

# Decompress back to original
original = Zlib::Inflate.inflate(compressed)
puts "Recovered matches? #{original == raw}"  # => true
```