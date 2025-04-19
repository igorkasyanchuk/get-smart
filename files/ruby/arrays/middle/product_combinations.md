## 🔄 Generating Combinations with `product`
`Array#product` computes the Cartesian product of multiple arrays, useful for generating test cases or option combinations. It returns an array of arrays representing every possible pairing.

```ruby
colors = ["red", "green"]
sizes  = ["S", "M", "L"]
combos = colors.product(sizes)
# => [["red","S"], ["red","M"], ["red","L"], ["green","S"], ...]
```
