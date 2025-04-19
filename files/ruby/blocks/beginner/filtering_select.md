## 🔍 Filtering Items with select
The `select` method (aka `find_all`) returns a new array containing all elements for which the block returns truthy. Use it to filter collections based on a condition.

```ruby
scores = [85, 42, 98, 73, 60]
high_scores = scores.select do |score|
  score >= 70
end
puts high_scores.inspect  # => [85, 98, 73]
```