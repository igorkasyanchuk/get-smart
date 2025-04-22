## 🗜️ Compress and Decompress Files with Zlib::Gzip

Ruby’s built‑in Zlib library makes it straightforward to gzip‑compress or decompress files without external dependencies. Use `Zlib::GzipWriter` to wrap an IO object and write compressed data, and `Zlib::GzipReader` to read it back. This streaming approach ensures you never load entire files into memory.

```ruby
require 'zlib'

# Compress input.txt into input.txt.gz
dir_in  = 'input.txt'
dir_out = 'input.txt.gz'
Zlib::GzipWriter.open(dir_out) do |gz|
  File.open(dir_in, 'rb') do |fp|
    while chunk = fp.read(16 * 1024) do
      gz.write(chunk)
    end
  end
end

# Decompress input.txt.gz back into output.txt
Zlib::GzipReader.open(dir_out) do |gz|
  File.open('output.txt', 'wb') do |fp|
    while chunk = gz.read(16 * 1024) do
      fp.write(chunk)
    end
  end
end
```