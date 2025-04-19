## 🌀 Generate Infinite Sequences with Enumerator::Lazy
Use `Enumerator::Lazy` to define potentially infinite streams, filter or map lazily, and materialize only what you need. Great for large data or algorithmic series.

```ruby
# Fibonacci lazy sequence
fib = Enumerator.new do |yielder|
  a, b = [0, 1]
  loop do
    yielder << a
    a, b = b, a + b
  end
end.lazy

# Select even numbers, take first 5
even_fibs = fib.select { |n| n.even? }.take(5).to_a
puts even_fibs.inspect
# => [0, 2, 8, 34, 144]
```