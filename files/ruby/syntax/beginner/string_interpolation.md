## 🔗 String Interpolation
Use `#{}` inside double-quoted strings to embed expressions directly. This approach is safer than concatenation and helps format dynamic content cleanly. Single-quoted strings do not support interpolation.

```ruby
name = "Ruby"
version = 3.1
puts "Welcome to #{name} #{version}!"
```