## 🚀 Chunked Streaming with Marshal for Large Payloads

Dumping or loading huge objects in one go can exhaust memory. Instead, stream chunks through IO to maintain backpressure and control memory footprint.

```ruby
# Writer: dumps objects into a file in a streaming fashion
File.open("data.marshal", "wb") do |f|
  objects = large_enumerable_of_records
  objects.each do |obj|
    chunk = Marshal.dump(obj)
    size  = [chunk.bytesize].pack("L>")
    f.write(size)
    f.write(chunk)
  end
end

# Reader: reads the length-prefixed chunks
File.open("data.marshal", "rb") do |f|
  until f.eof?
    size_data = f.read(4)
    break unless size_data
    size = size_data.unpack1("L>")
    chunk = f.read(size)
    record = Marshal.load(chunk)
    process(record)
  end
end
```

This pattern avoids building one giant blob and lets you process each object sequentially, keeping memory usage bounded.