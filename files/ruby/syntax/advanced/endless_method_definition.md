## 🛣️ Use Endless Method Definitions
Ruby 3.0 introduced endless method definitions to make single-expression methods more terse. Replace multi-line `def ... end` with a single line using `=` to assign the return value directly.

```ruby
# Before Ruby 3.0
def greet(name)
  "Hello, #{name}!"
end

# With endless method definition (Ruby 3.0+)
def greet(name) = "Hello, #{name}!"

puts greet("Bob")  # => "Hello, Bob!"
```