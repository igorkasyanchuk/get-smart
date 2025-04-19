## ➕ Append Content to an Existing File

Use append mode (`'a'`) to add data to the end of a file without erasing existing content. Blocks still work here to guarantee you close the file.

```ruby
File.open('log.txt', 'a') do |file|
  file.puts "New log entry at #{Time.now}"
end
```