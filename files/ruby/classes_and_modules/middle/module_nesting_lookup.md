## 🚀 Understanding Constant Lookup in Nested Modules

Ruby searches constants lexically before going to ancestors. Nesting modules affects how constants are resolved, so structure your modules to avoid unexpected lookups.

```ruby
module Outer
  X = 'outer'

  module Inner
    X = 'inner'

    def self.value
      X            # 'inner' from current scope
    end

    def self.outer_x
      ::Outer::X  # 'outer' using top-level lookup
    end
  end
end

puts Outer::Inner.value      # => "inner"
puts Outer::Inner.outer_x    # => "outer"
```