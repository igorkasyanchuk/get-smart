## ↪️ Iterative Matching with \G Anchor
Use the `\G` anchor to resume regex matching at the end of the previous match, ideal for stateful scans. Combine with `String#scan` or manual loops for incremental parsing.

```ruby
str = '1,2,3'
pattern = /(?:\G,?)(\d+)/
numbers = []
str.scan(pattern) { |num| numbers << num[0].to_i }
# numbers => [1, 2, 3]
```