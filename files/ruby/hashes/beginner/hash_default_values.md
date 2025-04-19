## 🎯 Setting Default Values
You can specify a default value for any key that doesn't exist in the hash by using `Hash.new(default)`. This prevents `nil` results and simplifies counting or accumulation tasks.

```ruby
scores = Hash.new(0)
scores[:alice] += 10
scores[:bob]   += 5
puts scores[:carol]  # => 0 (default)
```