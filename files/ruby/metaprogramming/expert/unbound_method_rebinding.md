## 🔄 UnboundMethod Rebinding for Context Switching

Use `UnboundMethod` to extract a method from one class or module and bind it to another object at runtime. This approach is useful for dynamic behavior swapping or mix-in replacement without inheritance.

```ruby
module Greeter
  def greet
    "Hello, #{name}!"
  end
end

class Person
  attr_accessor :name
  def initialize(name); @name = name; end
end

# Extract and rebind
um = Greeter.instance_method(:greet)
person = Person.new('Alice')
bound = um.bind(person)
puts bound.call     # => "Hello, Alice!"
```