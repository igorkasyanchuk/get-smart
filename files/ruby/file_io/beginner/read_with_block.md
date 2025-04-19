## 📖 Read a File with a Block

Using `File.open` with a block ensures the file is closed automatically when done. This is the preferred way to safely read file contents and avoid resource leaks.

```ruby
File.open('example.txt', 'r') do |file|
  content = file.read
  puts content
end
```