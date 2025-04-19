## 🔄 Iterate Over Each Line with `File.foreach`

`File.foreach` reads a file line by line, yielding each to a block. It's memory-efficient because it doesn't load the entire file into memory.

```ruby
File.foreach('data.csv') do |line|
  puts line.chomp.split(',') # process CSV row
end
```