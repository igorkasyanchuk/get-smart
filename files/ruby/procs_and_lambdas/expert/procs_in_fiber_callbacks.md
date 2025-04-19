## 🔄 Integrating Procs with Fiber-based Concurrency
Use procs as lightweight callbacks in Fiber-based cooperative concurrency to manage I/O or CPU-bound tasks. Pass lambdas into fibers to encapsulate state and resume execution precisely where needed.

```ruby
require 'fiber'

producer = Fiber.new do
  3.times do |i|
    Fiber.yield i * 2
  end
end

consumer = -> do
  while value = producer.resume
    puts "Consumed: #{value}"
  end
end

consumer.call
```

Encapsulate retry logic, backoff strategies, or streaming transforms as procs, and orchestrate them with `Fiber.yield`/`resume` for fine-grained control.