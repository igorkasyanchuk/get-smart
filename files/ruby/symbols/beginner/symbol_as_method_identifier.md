## 🔑 Refer to Methods Dynamically with Symbols and `send`
Symbols are commonly used to reference method names when calling them dynamically. This pattern keeps your code DRY and flexible.

```ruby
class Greeter
  def hello
    "Hello, world!"
  end
  def goodbye
    "Goodbye, world!"
  end
end

g = Greeter.new
[:hello, :goodbye].each do |method_name|
  puts g.send(method_name)  # Dynamically calls hello and goodbye
end
```

By passing method names as symbols to `send`, you can loop through actions or callbacks without hardcoding each method call.