## 🔍 Dynamic Local Variables with Binding

Ruby's `Binding` object allows introspection and manipulation of local variables at runtime, which is invaluable for metaprogramming and live debugging. You can retrieve, set, and even define new local variables dynamically using `local_variable_*` methods and `eval`. This approach enables on‑the‑fly adjustments to scope without redefining methods.

```ruby
def demo_binding
  x = 1
  b = binding

  # List existing locals
  p b.local_variables            # => [:x]

  # Define a new local variable `y`
  b.local_variable_set(:y, 2)
  p b.eval("x + y")            # => 3

  # Create and retrieve another
  b.eval("z = x * y")
  p b.local_variable_get(:z)     # => 2
end

demo_binding
```