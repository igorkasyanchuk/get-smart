## 🔁 Advanced `Range#step` Usage
`Range#step` lets you iterate with custom increments—even non‑integers or negative steps—providing fine‑grained control over progression. Combine it with blocks or convert to arrays for quick sequences.

```ruby
# Floating‑point increments
p (0.0..1.0).step(0.2).to_a  # => [0.0, 0.2, 0.4, 0.6, 0.8, 1.0]

# Negative stepping
(10..2).step(-2) { |i| puts i }  # prints 10, 8, 6, 4, 2

# Alphabetical stepping via String#succ
p ('a'..'g').step(2).to_a      # => ["a", "c", "e", "g"]
```