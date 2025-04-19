## 💡 Mix in Behavior with Modules
Modules let you share methods across classes without inheritance. Use `include ModuleName` to mix in instance methods.

```ruby
module Walkable
  def walk
    "I am walking!"
  end
end

class Person
  include Walkable
end

p = Person.new
puts p.walk  # => "I am walking!"
```