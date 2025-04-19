## 🎯 Define `initialize`
The `initialize` method runs automatically when you call `.new`. Use it to set up instance variables with default values or required parameters.

```ruby
class Person
  attr_reader :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end
end

p = Person.new("Carol", 25)
puts "#{p.name} is #{p.age} years old."  # => "Carol is 25 years old."
```