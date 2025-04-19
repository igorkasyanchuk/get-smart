## ❄️ Freeze Strings for Improved Performance

Mutating string literals creates new objects and increases GC pressure. Use the frozen string literal pragma or `String#freeze` to prevent unnecessary allocations.

```ruby
# Magic comment at the top of your file:
# frozen_string_literal: true

def greet(name)
  # name << "!"  # => raises RuntimeError: can't modify frozen String
  "Hello, #{name}!"  # no new literal allocated for 'Hello, '
end

# Explicit freezing
greeting = "Welcome".freeze
puts greeting.frozen?  # => true
# greeting << "!"    # => RuntimeError: can't modify frozen String
```

Enabling `frozen_string_literal` in modern Ruby (>= 2.3) reduces transient string churn and speeds up your application.