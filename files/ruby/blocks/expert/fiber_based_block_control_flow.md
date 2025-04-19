## 🔄 Fiber-Based Block Flow Control
Leverage `Fiber` with blocks to create lightweight coroutines or generators that can pause and resume execution. This pattern simplifies stateful pipelines, infinite generators, and cooperative multitasking.

```ruby
producer = Fiber.new do
  x = 1
  loop do
    x *= 2
    Fiber.yield x
  end
end

# Pull next 5 values
5.times { puts producer.resume } # => 2, 4, 8, 16, 32
```