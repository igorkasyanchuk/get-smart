## 🔄 Symbols vs. Strings as Keys
Symbols are immutable and reused across your program, making them more memory-efficient than strings. Choose symbols for static keys and strings when you need dynamic or user-generated keys.

```ruby
# Symbol keys
user = { id: 1, role: "admin" }

# String keys
dynamic_data = {}
dynamic_data[gets.chomp] = gets.chomp
```