## 📝 Write to a File Safely

Opening a file in write mode (`'w'`) allows you to create or overwrite a file. Using a block ensures the file is closed properly once writing is complete.

```ruby
File.open('output.txt', 'w') do |file|
  file.puts "Hello, world!"
  file.write "This is a second line."
end
```