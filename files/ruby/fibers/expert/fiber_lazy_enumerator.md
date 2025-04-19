## 🔄 Implementing Generators and Lazy Enumerators

Use `Fiber` to build custom generators that yield sequence values on demand. Wrapping your Fiber in an `Enumerator` gives you built‑in lazy iteration, backpressure control, and composability with Ruby’s Enumerable API.

```ruby
def fibonacci_generator
  Fiber.new do
    a, b = 0, 1
    loop do
      Fiber.yield a
      a, b = b, a + b
    end
  end
end

fib = Enumerator.new do |yielder|
  gen = fibonacci_generator
  loop { yielder << gen.resume }
end

# Lazy take first 10 fib numbers
iusages = fib.take(10)
puts usages.inspect # => [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
```
