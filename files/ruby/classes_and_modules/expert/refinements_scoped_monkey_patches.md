## 🛠️ Using Refinements to Scope Monkey Patches
Refinements allow you to apply monkey patches in a limited scope, preventing global side effects. This is particularly useful when you need to alter behavior for a specific library or component without affecting the entire application. You can define refinements in a module and selectively activate them with `using`.

```ruby
module StringExtensions
  refine String do
    def shout
      upcase + "!!!"
    end
  end
end

class Greeter
  using StringExtensions

  def greet(name)
    puts "Hello, #{name.shout}"  # Only works here
  end
end
```

Outside `Greeter`, `String#shout` remains untouched, preserving global stability.