## 🗂️ Hashes for Key-Value Storage

Hashes (dictionaries) map unique keys to values, allowing fast lookup. Keys are often symbols or strings, and values can be any object. You can add, update, access, and iterate over key-value pairs easily.

```ruby
# Define a hash
person = { name: 'Bob', age: 30 }
# Access a value by key
puts person[:name]   # => Bob
# Add or update a key
person[:occupation] = 'Developer'
# Iterate over key-value pairs
person.each do |key, value|
  puts "#{key}: #{value}"
end
```