## 🔧 Define an `initialize` Method

Ruby calls the `initialize` method automatically when creating a new object. Use `initialize` to set up instance variables or perform setup tasks. You can pass arguments to `new`, which are forwarded to `initialize`.

```ruby
class Person
  def initialize(name, age)
    @name = name
    @age = age
  end
end

person = Person.new('Alice', 30)
```