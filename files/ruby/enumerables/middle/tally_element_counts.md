## 🧮 Effortless Counting with tally

Instead of `each_with_object` or `reduce` to count frequencies, Ruby’s `tally` returns a hash of element counts in a single call. It works on any enumerable and handles empty cases seamlessly.

```ruby
items = %w[apple banana apple cherry banana apple]
counts = items.tally
# => {"apple"=>3, "banana"=>2, "cherry"=>1}
```