## 🎭 Scope Core Extensions Safely with Refinements
Refinements let you patch core classes in a module or class scope without polluting global behavior.

```ruby
module StringExtras
  refine String do
    def shout
      upcase + "!"
    end
  end
end

class Greeter
  using StringExtras

  def greet(name)
    name.shout
  end
end

puts Greeter.new.greet("hello")
# => "HELLO!"

# Outside the class, original String unaffected:
begin
  "hello".shout
rescue NoMethodError => e
  puts e.message
end
# => undefined method `shout' for "hello":String
```