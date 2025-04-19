## ✅ Checking if a Value Falls Within a Range

Use `include?` or `cover?` to test membership. `cover?` is faster for numeric ranges because it checks endpoints, while `include?` iterates internally.

```ruby
range = (1..100)
range.include?(50) # => true
range.include?(150)# => false

range.cover?(50)   # => true
range.cover?(150)  # => false
```