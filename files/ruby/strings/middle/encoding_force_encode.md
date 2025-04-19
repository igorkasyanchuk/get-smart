## 🛠 Handle Encodings with force_encoding and encode
When processing external data (files, network), you may encounter mismatched or invalid encodings. Use `force_encoding` to tell Ruby how to interpret raw bytes, and `encode` to convert strings safely between encodings. Combine with error-handling options to avoid exceptions.

```ruby
raw = File.read("data.txt", mode: "rb")
# Assume the file is actually ISO-8859-1
text = raw.force_encoding("ISO-8859-1")
# Convert to UTF-8, replacing invalid bytes
utf8_text = text.encode("UTF-8", invalid: :replace, undef: :replace, replace: "?")
puts utf8_text.encoding  # => #<Encoding:UTF-8>
```