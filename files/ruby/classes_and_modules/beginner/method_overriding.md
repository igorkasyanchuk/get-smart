## 🔄 Override Methods in Subclasses

Override superclass methods by defining a method with the same name in the subclass. You can also call `super` inside the overriding method to invoke the parent implementation. This allows extension or modification of inherited behavior.

```ruby
class Animal
  def move
    'I move in some way'
  end
end

class Bird < Animal
  def move
    super + ' by flying'
  end
end

puts Bird.new.move  # => 'I move in some way by flying'
```