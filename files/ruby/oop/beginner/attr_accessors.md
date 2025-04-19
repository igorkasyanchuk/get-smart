## ⚙️ Use `attr_accessor`
Ruby provides shortcuts for creating getter and setter methods. `attr_accessor :attribute` automatically defines both methods to read and write instance variables.

```ruby
class Person
  attr_accessor :name, :age
end

p = Person.new
p.name = "Bob"
p.age = 30
puts p.name  # => "Bob"
puts p.age   # => 30
```