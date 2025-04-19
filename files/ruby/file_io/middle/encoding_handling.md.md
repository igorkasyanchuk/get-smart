## 🔤 Handling File Encodings Explicitly
Specifying external and internal encodings avoids invalid byte sequences and ensures proper string conversion. Use `:encoding` option with `File.open`.

```ruby
File.open('data.csv', 'r:ISO-8859-1:UTF-8') do |f|
  f.each_line do |line|
    puts line.encoding  # => UTF-8
  end
end
```