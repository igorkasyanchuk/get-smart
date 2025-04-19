## 🌀 Harness Lazy Enumerators for Infinite Streams

Enumerators in Ruby can be made lazy to handle potentially infinite sequences without exhausting memory. Using `Enumerator.new` and `lazy`, you can define streams like the Fibonacci sequence and retrieve only as many elements as you need on demand.

```ruby
fib = Enumerator.new do |y|
  a, b = 0, 1
  loop do
    y << a
    a, b = b, a + b
  end
end.lazy

p fib.take(10).to_a
# => [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
```