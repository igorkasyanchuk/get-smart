## 🧩 Override Methods
Subclasses can override parent class methods to provide specialized behavior. Use `super` to call the original implementation if needed.

```ruby
class Animal
  def speak
    "some sound"
  end
end

class Cat < Animal
  def speak
    super + ", meow!"
  end
end

cat = Cat.new
puts cat.speak  # => "some sound, meow!"
```