## 📊 Counting with `Array#tally`

Introduced in Ruby 2.7, `tally` counts occurrences of elements in an array and returns a hash. It’s the quickest way to get frequency distributions.

```ruby
items = ["apple", "banana", "apple", "orange", "banana"]
counts = items.tally
# => { "apple" => 2, "banana" => 2, "orange" => 1 }
```