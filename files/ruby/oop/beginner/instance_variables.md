## 🔑 Use Instance Variables
Instance variables (prefixed with `@`) hold data specific to each object. They’re accessible across all instance methods in the same object.

```ruby
class Person
  def set_name(name)
    @name = name
  end

  def greet
    "Hello, my name is #{@name}!"
  end
end

p = Person.new
p.set_name("Alice")
puts p.greet  # => "Hello, my name is Alice!"
```