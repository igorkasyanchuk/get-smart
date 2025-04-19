## 🛠️ Debugging with `tap` in Method Chains

`tap` yields the object to a block and returns it, making it ideal for inserting debug statements in chains without breaking the flow.

```ruby
(1..5)
  .map { |n| n * 2 }
  .tap { |arr| puts "After doubling: #{arr.inspect}" }
  .select(&:odd?)
  .tap { |arr| puts "After selecting odds: #{arr.inspect}" }
```