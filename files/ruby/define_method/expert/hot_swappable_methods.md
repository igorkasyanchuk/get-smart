## ⚡ Hot-Swap Methods with Refinements and define_method

Refinements let you apply scoped patches without altering global behavior. Combine `Module#refine` with `define_method` to generate hot-swappable implementations that activate only under `using`. This is invaluable for targeted monkey-patching, testing, or feature toggles.

```ruby
module StringPatch
  refine String do
    define_method(:reverse) do
      "[patched] #{super()}"
    end
  end
end

using StringPatch
puts "abc".reverse
# => "[patched] cba"
# Outside this scope, String#reverse remains untouched.
```