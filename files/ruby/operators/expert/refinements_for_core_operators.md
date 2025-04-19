## 🚀 Scoped Refinements for Core Operators

Use Ruby refinements to override core operator behavior within a narrow scope, avoiding global patch pollution. This is critical when writing gems that must not affect other code.

```ruby
module SafeMath
  refine Integer do
    def /(other)
      return Float::INFINITY if other.zero?
      super
    end
  end
end

using SafeMath
puts 10 / 0   # ⇒ Infinity

# Outside the refinement, behavior remains unchanged:
Module.new { puts 10 / 0 } # raises ZeroDivisionError
```