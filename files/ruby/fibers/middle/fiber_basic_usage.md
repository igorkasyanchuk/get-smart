## 🔄 Basic Fiber Creation and Execution
You can define a fiber with `Fiber.new` and control its execution using `resume` and `yield`. This allows you to pause and resume code at specific points, enabling non-blocking workflows within a single thread. Fibers are lighter than threads and give you fine-grained control over where execution should continue.

```ruby
fiber = Fiber.new do
  puts "Inside fiber"
  Fiber.yield
  puts "Resuming fiber"
end

puts "Before resume"
fiber.resume    # => "Inside fiber"
puts "After first resume"
fiber.resume    # => "Resuming fiber"
```