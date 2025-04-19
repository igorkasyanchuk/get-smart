## ❓ Defined Operator
The `defined?` operator checks whether a given expression is defined, returning a descriptive string or `nil`. It’s useful for metaprogramming and conditional logic based on method or constant existence.

```ruby
defined? some_undefined_var # => nil
x = 5
defined? x                   # => "local-variable"

defined? Math::PI            # => "constant"
```