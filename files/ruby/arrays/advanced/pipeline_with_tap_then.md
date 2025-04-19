## 🔗 Fluent Array Pipelines with `then` and `tap`

Use `tap` to insert side‑effects (e.g., logging or debugging) without breaking the method chain, and `then` to transform the entire result at a given step. This keeps your pipeline readable and avoids temporary variables.

```ruby
result = [1,2,3,4]
  .select(&:even?)
  .tap { |evens| STDOUT.puts("Evens: #{evens.inspect}") }
  .map { |n| n * n }
  .then { |squares| squares.sum }
# Logs "Evens: [2,4]" then returns 20
```