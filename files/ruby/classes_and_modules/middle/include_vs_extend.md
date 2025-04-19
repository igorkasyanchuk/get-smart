## 🔄 Include vs Extend

Understanding when to use `include` versus `extend` helps you organize shared behavior in classes and modules. `include` mixes module methods as instance methods, while `extend` adds them as class methods. Use `extend` for utility methods scoped to the class and `include` for behaviors each instance needs.

```ruby
module Loggable
  def log(message)
    puts "[LOG] #{message}"
  end
end

class ServiceA
  include Loggable   # service_a.log(...) available on instances
end

class ServiceB
  extend Loggable    # ServiceB.log(...) available on class
end
```