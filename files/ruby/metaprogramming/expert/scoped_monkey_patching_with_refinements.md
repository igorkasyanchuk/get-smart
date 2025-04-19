## 🧩 Scoped Monkey Patching with Refinements

Use Ruby refinements to apply method overrides in a controlled, lexically scoped manner. This prevents global side effects and keeps your patch local to the file or module where it’s needed.

```ruby
module StringExtensions
  refine String do
    def shout
      upcase + '!!!'
    end
  end
end

module Speaker
  using StringExtensions

  def speak(msg)
    puts msg.shout
  end
end

class Announcer
  extend Speaker
end

Announcer.speak('hello')   # => "HELLO!!!"
"hello".shout             # => NoMethodError outside the refinement scope
```