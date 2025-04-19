## ➕ Accumulate Values with inject
`inject` (a.k.a. `reduce`) combines all elements by passing an accumulator and each element to the block. Use it for summing, product, or building complex results from an enumerable.

```ruby
# Sum of numbers
sum = [1, 2, 3, 4].inject(0) { |acc, n| acc + n }
# => 10

# Build a hash count
tokens = %w[a b a c b a]
freq = tokens.inject(Hash.new(0)) do |counts, token|
  counts[token] += 1
  counts
end
# => {"a"=>3, "b"=>2, "c"=>1}
```