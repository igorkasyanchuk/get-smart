## 🐍 Runtime refinements for scoped monkey‑patches
Use Ruby’s `refine` and `using` to patch core classes or libraries in a controlled, lexical scope. This prevents global side effects while allowing you to augment behavior just where needed.

```ruby
module StringExtensions
  refine String do
    def titleize
      split.map(&:capitalize).join(' ')
    end
  end
end

class Formatter
  using StringExtensions

  def format(name)
    name.titleize
  end
end
```