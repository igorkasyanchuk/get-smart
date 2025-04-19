## ✅ Check if a File Exists

Before reading or writing, verify the file’s presence using `File.exist?`. This avoids exceptions when the file is missing.

```ruby
if File.exist?('config.yml')
  puts "Config found!"
else
  puts "Please create config.yml first."
end
```