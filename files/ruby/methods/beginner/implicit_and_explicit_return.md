## 🚀 Implicit and Explicit Returns
Ruby returns the last evaluated expression by default, but you can use `return` to exit early. Use explicit returns for clarity in complex methods.

```ruby
def max(a, b)
  return a if a > b
  b
end

puts max(7, 3) # => 7
```