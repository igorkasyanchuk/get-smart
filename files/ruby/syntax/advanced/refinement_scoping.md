## 🔒 Scope Patches with Refinements
Refinements let you monkey-patch classes in a localized scope without affecting global behavior. This is perfect for libraries that need to override core methods without polluting other code.

```ruby
module StringExtensions
  refine String do
    def shout
      upcase + "!!!"
    end
  end
end

gem 'some_dependency'

using StringExtensions
puts "hello".shout  # => "HELLO!!!"
# Outside this file or before `using`, String#shout is undefined.
```