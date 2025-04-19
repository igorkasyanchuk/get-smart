## 🔌 Integrating Fibers with the Async Gem for Task Coordination

Combine `Fiber` with the `async` gem’s reactor to orchestrate low‑latency tasks. You can map Fibers onto `Async::Task`s, leverage `Async::Semaphore` for backpressure, and drop into fiber contexts for fine‑grained control when needed.

```ruby
require 'async'
require 'async/semaphore'

Async do |task|
  semaphore = Async::Semaphore.new(10)

  100.times do |i|
    semaphore.async do
      # This block runs inside a Fiber under the Async reactor
      data = Fiber.current.yield(:waiting)
      puts "Processed #{i} with data: #{data}"
    end
  end
end
```

In this setup, each `semaphore.async` spawns a Fiber‑backed task, and you can manually yield or resume via `Fiber.current` for custom signaling and error propagation.