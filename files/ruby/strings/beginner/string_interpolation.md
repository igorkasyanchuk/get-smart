## 🚀 String Interpolation

Ruby lets you embed expressions directly into double-quoted strings using `#{}` syntax. This is more readable and safer than concatenation, especially when inserting variables or method calls. It only works in double-quoted or `%Q` strings, not single-quoted ones.

```ruby
name = "Alice"
age = 30
puts "Hello, #{name}! You are #{age} years old."  # => Hello, Alice! You are 30 years old.
```