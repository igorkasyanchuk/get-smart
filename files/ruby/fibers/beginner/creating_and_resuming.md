## 🧵 Creating and Resuming a Fiber

To create a fiber, call `Fiber.new` with a block. Inside the block, use `Fiber.yield` to pause, and outside use `resume` to continue. Each call to `resume` picks up right after the last `yield`, making it ideal for controlled step-by-step logic.

```ruby
counter = Fiber.new do
  n = 1
  loop do
    Fiber.yield n
    n += 1
  end
end

puts counter.resume   # => 1
puts counter.resume   # => 2
puts counter.resume   # => 3
```