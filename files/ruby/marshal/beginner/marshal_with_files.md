## 📝 Persisting Data to Files

You can write marshaled data directly to a file for simple persistence. Open a file in binary mode (`"wb"`) for dumping and in binary-read mode (`"rb"`) for loading. This technique is handy for quick state saves without setting up a database.

```ruby
# Save the object to disk
File.open("data.bin", "wb") do |file|
  file.write(Marshal.dump([1, 2, 3]))
end

# Read it back
array = File.open("data.bin", "rb") do |file|
  Marshal.load(file)
end
puts array.inspect  # => [1, 2, 3]
```