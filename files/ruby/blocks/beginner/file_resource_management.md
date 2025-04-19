## 📂 Managing Files Safely with File.open
When you use `File.open` with a block, Ruby automatically closes the file when the block ends. This ensures proper resource cleanup.

```ruby
File.open("example.txt", "w") do |file|
  file.puts "Hello, world!"
end
# The file is automatically closed here, even if an error occurs.
```