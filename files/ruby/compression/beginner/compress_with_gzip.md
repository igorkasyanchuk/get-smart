## 📦 Compress a File with Gzip

Use Ruby’s built-in Zlib library to quickly gzip-compress a file. This reduces file size for storage or transfer. You open a `GzipWriter` on the destination and stream the source file into it.

```ruby
require 'zlib'

source      = 'example.txt'
destination = 'example.txt.gz'

Zlib::GzipWriter.open(destination) do |gz|
  File.open(source, 'rb') do |file|
    while chunk = file.read(16 * 1024)
      gz.write(chunk)
    end
  end
end
```
