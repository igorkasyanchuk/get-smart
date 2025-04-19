## 🔄 Lazy Infinite Streams with Enumerator::Lazy

Leverage Enumerator::Lazy to build potentially infinite, memory-efficient sequences by chaining transformations only when needed. Lazy enumerators defer computation until you call a terminal operation, preventing memory bloat and unnecessary work.

```ruby
fib = Enumerator.new do |yielder|
  a, b = [0, 1]
  loop do
    yielder << a
    a, b = b, a + b
  end
end.lazy

# Take first 10 Fibonacci numbers, map and select evens
result = fib.take(10)
            .map { |n| n * 2 }
            .select(&:even?)

p result #=> [0, 4, 6, 16, 30]
```