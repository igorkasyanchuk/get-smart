## 🗝️ Use Ranges as Hash Keys (and Avoid Pitfalls)
Ruby allows Range objects as hash keys, but beware: `hash` and `eql?` depend on both endpoints and exclusivity. Two ranges with identical boundaries but different exclusivity are distinct; use `cover?` in your lookup logic to abstract those nuances.

```ruby
pricing = {
  (0..10)   => "$",
  (11..20)  => "$$",
  (21...30) => "$$$"
}

def price_for(qty, table)
  # direct lookup fails for exclusivity mismatches
  entry = table.find { |range, _| range.cover?(qty) }
  entry&.last
end

puts price_for(20, pricing)  # => "$$"
```