## 🗜️ Streaming Large File Compression with Zlib

When working with very large files, loading the entire file into memory can lead to out‑of‑memory errors. By streaming data through `Zlib::GzipWriter`, you can read and compress in chunks with minimal memory overhead. This approach also allows you to tune buffer sizes for optimal throughput.

```ruby
require 'zlib'

INPUT_PATH  = 'path/to/large_input.log'
OUTPUT_PATH = 'path/to/compressed_output.gz'
BUFFER_SIZE = 16 * 1024  # 16 KB chunks

Zlib::GzipWriter.open(OUTPUT_PATH, Zlib::BEST_SPEED) do |gz|  # or Zlib::BEST_COMPRESSION
  File.open(INPUT_PATH, 'rb') do |file|
    while (chunk = file.read(BUFFER_SIZE))
      gz.write(chunk)
    end
  end
end
```

You can decompress in a similarly streaming fashion using `Zlib::GzipReader.open` and writing out chunks to a new file. This pattern ensures constant, predictable memory usage.