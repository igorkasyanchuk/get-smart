## 🔧 Scoped Class Modification with Refinements
Refinements let you monkey-patch classes in a localized scope, preventing global side effects. This is ideal when you need to extend a third‑party library without affecting the entire application.

```ruby
module StringRefinements
  refine String do
    def titleize
      split(' ').map(&:capitalize).join(' ')
    end
  end
end

using StringRefinements
puts "hello world".titleize  # => "Hello World"

# Outside this file or block, String remains unchanged.
```