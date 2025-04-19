## 📁 Listing and Filtering Directory Contents

Working with directories often starts with reading their contents. You can use `Dir.entries` to get all items (including `.` and `..`) or `Dir.glob` to match specific patterns. Pair these with `File.directory?` or `File.file?` to distinguish between files and subdirectories.

```ruby
# List everything except . and ..
entries = Dir.entries("./my_folder") - %w[. ..]
entries.each do |entry|
  path = File.join("./my_folder", entry)
  if File.directory?(path)
    puts "📂 Directory: #{entry}"
  else
    puts "📄 File:      #{entry}"
  end
end
```

```ruby
# List only Ruby files with Dir.glob
Dir.glob("./my_folder/**/*.rb").each do |file|
  puts "Found Ruby file: #{file}"
end
```