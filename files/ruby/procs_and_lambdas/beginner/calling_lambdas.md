## 🎬 Calling Lambdas and Handling Returns

Lambdas execute like methods: `return` inside them only exits the lambda, not the outer method. This allows you to use `return` safely in callbacks without halting the calling context.

```ruby
def wrapper
  l = -> { return "returned from lambda" }
  result = l.call
  puts result             # => returned from lambda
  puts "still in wrapper"  # => still in wrapper
end

wrapper
```