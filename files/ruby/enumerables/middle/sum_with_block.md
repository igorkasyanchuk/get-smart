## ➕ Conditional Summation Using sum

The `sum` method accepts an initial accumulator and a block, letting you compute custom totals in one pass. Replace `map`+`reduce` combos with `sum` and inline logic for brevity and clarity.

```ruby
numbers = [1, 2, 3, 4, 5]
# Sum only even numbers doubled
result = numbers.sum(0) do |n|
  n.even? ? n * 2 : 0
end
# => 12   # (2*2 + 4*2)
```