## ⚖️ Enforcing Arity and Argument Types at Runtime
Lambdas enforce arity by default, but you can add runtime type checks inside procs for stricter contracts. Combine `#lambda` with custom validators to fail early on unexpected inputs, improving reliability in critical code paths.

```ruby
type_checked = lambda do |a, b|
  raise TypeError, "Expected Integer" unless a.is_a?(Integer) && b.is_a?(Integer)
  a * b
end

puts type_checked.call(3, 4)    # => 12
puts type_checked.call("3", 4) # => TypeError: Expected Integer
```

Wrap these in helper methods to generate families of typed lambdas dynamically.