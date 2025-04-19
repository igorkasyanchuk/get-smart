## 🌀 Lazy Infinite Enumerator
Use Enumerator::Lazy to work with infinite or very large sequences without consuming excessive memory. Chain transformations and terminate early when a stopping condition is met.

```ruby
# Generate an infinite sequence of Fibonacci numbers lazily
enumerator = Enumerator.producer do |y|
  a, b = [0, 1]
  loop do
    y << a
    a, b = b, a + b
  end
end.lazy

# Take the first 10 even Fibonacci numbers
evens = enumerator.select(&:even?).first(10)
puts evens
```