## 🎯 Default and Keyword Arguments

Ruby lets you specify default values for both positional and keyword arguments, improving the flexibility and readability of your methods. Default arguments cover common cases without overloading methods, while keyword arguments make intent explicit at call sites. Here's how you can combine both.

```ruby
# Default positional and keyword arguments
def greet(name = "World", punctuation: "!")
  puts "Hello, #{name}#{punctuation}"
end

# Usage examples
greet                   #=> "Hello, World!"
greet("Alice")        #=> "Hello, Alice!"
greet("Bob", punctuation: "?")  #=> "Hello, Bob?"
```