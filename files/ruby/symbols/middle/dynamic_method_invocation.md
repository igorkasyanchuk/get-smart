## 🚀 Dynamic Method Calls with Symbol and `send`
You can use symbols to dispatch methods dynamically at runtime via `send` or its safer counterpart `public_send`. This is handy for building flexible APIs, DSLs, or delegators. Remember to use `public_send` when you want to respect access control and avoid invoking private methods by accident.

```ruby
class Greeter
  def hello(name)
    "Hello, #{name}!"
  end

  private def secret
    "Top Secret"
  end
end

greeter = Greeter.new
method = :hello
puts greeter.send(method, "World")        # => "Hello, World!"
puts greeter.public_send(method, "Alice") # => "Hello, Alice!"
# greeter.public_send(:secret)             # => NoMethodError
```