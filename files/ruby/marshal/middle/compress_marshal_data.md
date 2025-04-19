## 📦 Compress Marshaled Data with Zlib
To save storage or network bandwidth, wrap your marshaled payload in compression. Use Ruby’s built-in `Zlib` to deflate the serialized string and inflate it on load. This can drastically reduce the size of large objects before persisting or transmitting.

```ruby
require 'zlib'

data = { logs: (1..1000).map { |i| "entry#{i}" } }

# Serialize and compress
packed = Zlib::Deflate.deflate(Marshal.dump(data))
puts "Compressed size: #{packed.bytesize}"

# Decompress and deserialize
original = Marshal.load(Zlib::Inflate.inflate(packed))
puts original[:logs].first  # => "entry1"
```