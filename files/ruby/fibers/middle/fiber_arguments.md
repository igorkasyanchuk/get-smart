## 🎯 Passing Values In and Out of Fibers
Fibers can exchange data with the caller by passing arguments to `resume` and returning values from the block. This pattern is useful for simple coroutines, pipelines, or implementing generators. Remember each `resume` returns the value passed to the corresponding `yield`, and vice versa.

```ruby
fiber = Fiber.new do |initial|
  puts "Received: #{initial}"
  next_value = Fiber.yield("yielded value")
  puts "Received next: #{next_value}"
  "final result"
end

# Start and capture yield
yielded = fiber.resume("start")  # => "yielded value"
puts yielded                       # => "yielded value"

# Resume with next data and capture return
result = fiber.resume("more data")
puts result                        # => "final result"
```