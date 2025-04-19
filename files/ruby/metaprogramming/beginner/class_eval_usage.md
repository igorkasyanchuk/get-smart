## 💡 Add Methods to a Class with `class_eval`

`class_eval` (or `module_eval`) executes a string or block in the context of a class/module definition. This is useful to inject methods or constants after a class is defined, enabling flexible extensions or plugins.

```ruby
class Person; end

Person.class_eval do
  def greet
    "Hello from #{self.class}!"
  end
end

p = Person.new
puts p.greet    # => "Hello from Person!"
```