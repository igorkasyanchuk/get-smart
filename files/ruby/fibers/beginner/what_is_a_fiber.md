## 🚀 What Is a Fiber?

Fibers are lightweight concurrency primitives in Ruby that let you pause and resume execution at specific points. They behave like coroutines, allowing you to switch contexts explicitly without threads. Fibers are great for stepping through a sequence of operations where you control when to yield and resume execution.

```ruby
fiber = Fiber.new do
  puts "Inside Fiber"
  Fiber.yield      # Pause here
  puts "Resumed Fiber"
end

puts "Before resume"
fiber.resume       # => "Inside Fiber"
puts "Between resumes"
fiber.resume       # => "Resumed Fiber"
```
