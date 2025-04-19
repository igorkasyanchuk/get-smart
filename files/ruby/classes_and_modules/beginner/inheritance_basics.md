## 🌳 Inherit from a Parent Class

Use `<` to make a class inherit behavior and attributes from another class. The subclass gains all methods and variables of the superclass and can add or override functionality. This promotes code reuse and logical hierarchies.

```ruby
class Animal
  def speak
    'Hello'
  end
end

class Dog < Animal
  def speak
    'Woof'
  end
end

puts Dog.new.speak  # => 'Woof'
```