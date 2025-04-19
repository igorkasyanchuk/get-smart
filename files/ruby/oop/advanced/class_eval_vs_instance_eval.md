## 🪄 Understand `class_eval` vs. `instance_eval`
Distinguish between `class_eval` (class‑scope) and `instance_eval` (instance‑scope) to inject behavior at the correct level. Misuse can lead to confusing scope bugs.

```ruby
class MyModel; end

# Adds instance methods to MyModel
define_methods = Proc.new do
  def dynamic_method
    'hello'
  end
end

MyModel.class_eval(&define_methods)
puts MyModel.new.dynamic_method  # => "hello"

# instance_eval modifies the singleton class of the receiver
o = MyModel.new

o.instance_eval do
  def singleton_method
    'world'
  end
end
puts o.singleton_method  # => "world"
```