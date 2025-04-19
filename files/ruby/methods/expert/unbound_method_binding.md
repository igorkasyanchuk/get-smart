## 🪝 Binding and Invoking Unbound Methods
Extract an `UnboundMethod` via `instance_method` and bind it to different objects to reuse logic across classes. This lets you decouple method definitions and apply them dynamically to any compatible receiver.

```ruby
class Greeter
  def initialize(name)
    @name = name
  end

  private
  attr_reader :name

  def greet(greeting)
    "#{greeting}, #{name}"
  end
end

uid = Greeter.instance_method(:greet)
alice = Greeter.new('Alice')
bound = uid.bind(alice)
puts bound.call('Hello')  # => "Hello, Alice"
```

```ruby
class Robot
  def name; 'R2-D2'; end
end
robot = Robot.new
puts uid.bind(robot).call('Beep')  # => "Beep, R2-D2"
```