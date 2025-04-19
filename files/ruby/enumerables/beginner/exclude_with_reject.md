## 🚫 Exclude Items with reject
The `reject` method is the opposite of `select`: it returns elements for which the block is `false`. Use `reject` to remove unwanted items from an enumerable in a clear, declarative way.

```ruby
numbers = [1, 2, 3, 4, 5]
# Remove odd numbers
non_odds = numbers.reject { |n| n.odd? }
# => [2, 4]

words = %w[hello world skip_this test]
filtered = words.reject { |w| w.start_with?('skip') }
# => ["hello", "world", "test"]
```