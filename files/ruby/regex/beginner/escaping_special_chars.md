## 🛡️ Escaping Special Characters
Use `Regexp.escape` to automatically escape user input or special characters. This ensures your pattern treats them literally.

```ruby
user_input = "file(1).txt"
escaped = Regexp.escape(user_input)
regex = /#{escaped}/
puts "Matched!" if "path/to/file(1).txt" =~ regex
```