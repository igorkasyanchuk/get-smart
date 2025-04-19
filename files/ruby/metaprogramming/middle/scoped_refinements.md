## 🛡 Scoped Monkey Patching with Refinements

Refinements let you apply monkey patches in a limited scope. This avoids global side effects while still leveraging core extensions when needed.

```ruby
module StringExtensions
  refine String do
    def shout
      upcase + "!"
    end
  end
end

class Greeter
  using StringExtensions

  def greet(name)
    name.shout
  end
end

puts Greeter.new.greet('hello')  # => "HELLO!"
# Outside Greeter, "hello".shout is undefined
```