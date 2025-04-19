## 📋 Read All Lines into an Array

`File.readlines` loads each line as an array element. This is handy for quick transformations or indexing lines.

```ruby
lines = File.readlines('tasks.txt')
lines.each_with_index do |line, idx|
  puts "[33m#{idx + 1}:[0m #{line.chomp}"
end
```