## 🔐 Scoped Method Overrides with Refinements
Refinements let you monkey‑patch methods only within a lexical scope, preventing global side effects. This is especially useful when you need a temporary or context‑specific tweak to a core class.

```ruby
module StringExtensions
  refine String do
    def to_json
      "\"#{self}\""
    end
  end
end

going = 'hello'
using StringExtensions
p going.to_json  # => "\"hello\""
# outside this block, String#to_json is untouched
```