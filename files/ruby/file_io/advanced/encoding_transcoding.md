## 🔤 On-the-Fly Encoding Conversion

When reading or writing files in different encodings, use `File.open` with `:external_encoding` and `:internal_encoding` to transcode automatically. This avoids manual `String#encode` calls and error handling.

```ruby
# Read UTF-16LE, write UTF-8
File.open('source.txt', 'r:utf-16le:utf-8') do |src|
  File.open('dest.txt', 'w:utf-8') do |dst|
    IO.copy_stream(src, dst)
  end
end
```

You can also specify `:invalid => :replace` or `:undef => :replace` to handle malformed data seamlessly.