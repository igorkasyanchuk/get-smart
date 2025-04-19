## 🔀 Generating Combinations and Permutations

Ruby’s Array supports `combination` and `permutation` for combinatorial tasks. Use these with a block to process results on the fly without collecting huge intermediate arrays. Useful for algorithmic puzzles, testing scenarios, or statistical sampling.

```ruby
letters = %w[a b c d]
# All 2-letter combinations:
letters.combination(2) { |combo| p combo }
# => ["a", "b"], ["a", "c"], ...

# All 3-permutations as arrays:
p letters.permutation(3).to_a
```