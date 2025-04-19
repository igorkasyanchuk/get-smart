## 📦 Inherit from a Parent Class
Inheritance lets you reuse and extend behavior. Use `< ParentClass` to make a subclass inherit methods and variables.

```ruby
class Animal
  def speak
    "Hello"
  end
end

class Dog < Animal
  def speak
    "Woof!"
  end
end

dog = Dog.new
puts dog.speak  # => "Woof!"
```