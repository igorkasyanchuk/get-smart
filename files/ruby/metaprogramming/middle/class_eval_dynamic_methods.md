## ✨ Define Class Methods with class_eval

`class_eval` (or `module_eval`) can inject code into a class definition at runtime. Use it to add class-level methods or wrap existing behavior dynamically.

```ruby
class MyService; end

MyService.class_eval do
  def self.hello
    "Hello from dynamically added class method!"
  end
end

puts MyService.hello  # => "Hello from dynamically added class method!"
```