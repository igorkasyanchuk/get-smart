## 🚀 Streaming Large Datasets with Compression

When dealing with massive objects, dumping to a string can exhaust memory. Instead, serialize directly to an IO stream and combine it with compression (e.g., Gzip) to write efficiently to disk or over the network.

```ruby
require 'zlib'

File.open('data.dump.gz', 'wb') do |file|
  gz = Zlib::GzipWriter.new(file)
  # Marshal.dump accepts any IO-like object
  Marshal.dump(large_object, gz)
  gz.close
end

# To load back:
File.open('data.dump.gz', 'rb') do |file|
  gz = Zlib::GzipReader.new(file)
  obj = Marshal.load(gz)
  gz.close
end
```