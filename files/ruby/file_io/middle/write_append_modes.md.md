## ✏️ Writing and Appending to Files
Use mode `"w"` to write (truncating existing content) and `"a"` to append without truncation. Always specify mode to avoid accidental data loss.

```ruby
# Overwrite the file
File.open('output.txt', 'w') do |f|
  f.puts 'New content'
end

# Append to the file
File.open('output.txt', 'a') do |f|
  f.puts 'Appended line'
end
```