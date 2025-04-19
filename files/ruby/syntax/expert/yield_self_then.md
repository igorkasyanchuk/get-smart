## 🛠️ Chaining with `yield_self` and `then`

Use `yield_self` (aliased as `then`) to inject intermediate operations into a fluent pipeline without breaking the chain. Particularly useful when you need side‑effects or conditional transformations.

```ruby
result = [1,2,3]
  .map(&:to_s)
  .then { |arr| puts "Strings: #{arr.join(',')}"; arr }
  .filter { |s| s.start_with?('2') }

p result # => ["2"]
```