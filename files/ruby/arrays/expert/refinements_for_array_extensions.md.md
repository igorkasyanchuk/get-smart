## 🔒 Refinements for Scoped Array Extensions
Use Ruby refinements to apply array enhancements locally, avoiding global pollution and conflicts. Refinements allow patching core classes within defined scopes safely.

```ruby
module ArrayMath
  refine Array do
    def dot(other)
      zip(other).map { |a,b| a * b }.sum
    end
  end
end

using ArrayMath
a = [1,2,3]
b = [4,5,6]
puts a.dot(b)   # => 32

# Outside this scope, Array#dot is undefined.
```