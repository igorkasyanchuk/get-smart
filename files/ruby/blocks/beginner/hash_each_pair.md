## 🗃️ Iterating Over Hashes with each_pair
`each_pair` (alias `each`) on a hash yields key-value pairs. It's the standard way to process or display hash contents.

```ruby
person = { name: "Alice", age: 30, city: "Paris" }
person.each_pair do |key, value|
  puts "#{key.capitalize}: #{value}"
end
# Output:
# Name: Alice
# Age: 30
# City: Paris
```