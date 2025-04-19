## 🛡️ Scoped Monkey Patching with Refinements
Use `refine` and `using` to apply monkey patches only within specific lexical scopes, preventing global pollution. This allows safe extensions of core classes for limited contexts such as testing or DSLs.

```ruby
module StringExtensions
  refine String do
    def shout
      upcase + "!"
    end
  end
end

using StringExtensions
puts "hello".shout  # => "HELLO!"
```

```ruby
# Outside the refinements scope, `shout` is undefined:
puts "world".respond_to?(:shout)  # => false
```