## 🚀 Instantiate Objects
Once you've defined a class, you can create actual objects by calling `.new` on the class. Each call to `.new` returns a new instance you can work with.

```ruby
class Person; end

person1 = Person.new
person2 = Person.new
puts person1.class  # => Person
```