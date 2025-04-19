## 💎 Define Constants in Classes

Constants (uppercase names) are used for values that should not change. Place them inside classes or modules for logical grouping. While Ruby constants can be reassigned with a warning, they signal intended immutability.

```ruby
class MathConstants
  PI = 3.14159
  E  = 2.71828
end

puts MathConstants::PI  # => 3.14159
```