## 🔄 Default Assignment Operator
The `||=` operator assigns a value only if the variable is `nil` or `false`. This is handy for memoization or setting defaults in one concise expression.

```ruby
def expensive_computation
  @result ||= compute_heavy_task
end
```