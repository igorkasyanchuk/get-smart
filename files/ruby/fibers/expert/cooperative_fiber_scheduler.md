## 🛠 Building a Cooperative Fiber Scheduler

Create a mini scheduler that round‑robins through Fibers, resuming only when they voluntarily yield. This design ensures predictable execution order and lets Fibers share CPU cooperatively without OS threads.

```ruby
class FiberScheduler
  def initialize
    @queue = []
  end

  def schedule(&block)
    @queue << Fiber.new { block.call }
  end

  def run
    until @queue.empty?
      fiber = @queue.shift
      if fiber.alive?
        reason = fiber.resume
        @queue << fiber if fiber.alive? && reason == :yield
      end
    end
  end
end

# Usage
tasker = FiberScheduler.new
5.times { |i| tasker.schedule { 10.times { puts "Task #{i}"; Fiber.yield(:yield) } }
}
tasker.run
```
