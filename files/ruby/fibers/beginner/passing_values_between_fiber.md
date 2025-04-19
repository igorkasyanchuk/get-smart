## 🔄 Passing Values Between Fiber and Caller

Fibers let you exchange data between the caller and the fiber block. You can pass an argument to `resume`, which becomes the return value of `Fiber.yield`, and vice versa. This pattern helps maintain state or pass configuration dynamically.

```ruby
fiber = Fiber.new do |starting|
  value = starting * 2
  input = Fiber.yield(value)
  puts "Caller sent: #{input}"
end

result = fiber.resume(5)            # result == 10
fiber.resume("Hello Fiber!")       # prints "Caller sent: Hello Fiber!"
```