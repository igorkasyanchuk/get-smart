## 🚀 Advanced Lazy Enumerator Chaining
Ruby’s `Enumerator::Lazy` builds memory-efficient, infinite sequences that only evaluate when needed. Chain `select`, `map`, and other transformations to process large or unbounded streams without intermediate arrays.

```ruby
fib = Enumerator.new do |y|
  a, b = [0, 1]
  loop do
    y << a
    a, b = b, a + b
  end
end.lazy

# Retrieve first 5 even Fibonacci numbers doubled
result = fib.select(&:even?).map { |n| n * 2 }.first(5)
puts result.inspect # => [0, 4, 10, 34, 88]
```